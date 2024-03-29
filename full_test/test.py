from __future__ import annotations

import os
import subprocess
import sys
import random
import shutil

from argparse import ArgumentParser
from enum import Enum, auto
from glob import glob
from typing import NamedTuple, Optional, Union
import re

from concurrent.futures import ThreadPoolExecutor, as_completed

TEST_ROUND = 1
TIMEOUT = 1000

# NOTE: 在这里修改你的编译器路径和参数。此处的默认值对应着gcc
# compiler_path = "riscv64-unknown-elf-gcc"
compiler_path = "../build/compiler"
# compiler_args = "-O2 -march=rv64gc -mabi=lp64f -xc++ -S -include ./runtime/sylib.h"[]
# compiler_args = "-O2 -march=rv32gc -mabi=ilp32f -xc++ -S -include ./runtime/sylib.h"
compiler_args = " -m -f"
qemu_command = "qemu-riscv32"

# 调用gcc进行链接的参数
gcc_args_rv64 = "-march=rv64gc -mabi=lp64f"
gcc_args_rv32 = "-march=rv32gc -mabi=ilp32f"
gcc_args = gcc_args_rv32

compile_error_log = "compile_error.log"

class Config(NamedTuple):
    compiler: str
    testcases: str
    compiler_args: str
    tempdir: str
    parallel: bool


class Result(Enum):
    LINKER_ERROR = auto()
    PASSED = auto()
    WRONG_ANSWER = auto()
    TIME_LIMIT_EXCEEDED = auto()
    GCC_ERROR = auto()


def get_config(argv: list[str]) -> Config:
    parser = ArgumentParser('simple-tester')
    parser.add_argument('-t', '--testcases',
                        metavar='<testcases>', required=True,
                        help='path to the directory containing testcases')
    parser.add_argument('-p', '--parallel', action='store_true', default=False, help='run parallely')
    index: int
    try:
        index = argv.index('--')
    except ValueError:
        index = len(argv)
    args = parser.parse_args(argv[:index])
    return Config(compiler=compiler_path,
                  testcases=args.testcases,
                  compiler_args=compiler_args,
                  tempdir='build',
                  parallel=args.parallel,
                  )


def get_testcases(config: Config) -> list[str]:
    testcases = [os.path.splitext(os.path.basename(file))[0]
                 for file in glob(os.path.join(config.testcases, '*.sy'))]
    testcases.sort()
    return testcases


def get_answer(file: str) -> tuple[list[str], int]:
    content = [line.strip() for line in open(file).read().splitlines()]
    return content[:-1], int(content[-1])


def get_time(file: str) -> Optional[int]:
    content = open(file).read().splitlines()
    if not content:
        return None
    content = content[-1]
    pattern = r'TOTAL:\s*(\d+)H-(\d+)M-(\d+)S-(\d+)us'
    matches = re.match(pattern, content)
    h, m, s, us = map(int, (matches.group(1), matches.group(2), matches.group(3), matches.group(4)))
    return ((h * 60 + m) * 60 + s) * 1_000_000 + us


def run(
    workdir: str,
    assembly: str,
    input: str,
    answer: str,
    round: int = 1,
    timing: bool = False,
) -> Union[Result, float]:
    assembly= "riscv/"+assembly+".s"
    name_body = os.path.basename(assembly).split('.')[0]
    executable = os.path.join(workdir, name_body + '.exec')
    output = os.path.join(workdir, name_body + '.stdout')
    time = os.path.join(workdir, name_body + '.stderr')
    # os.system(f'riscv64-unknown-elf-gcc {gcc_args} {assembly} -o {executable}')
    if os.system(f'riscv64-unknown-elf-gcc {gcc_args} {assembly} runtime/libsysy.a -o {executable}') != 0:
        return Result.LINKER_ERROR
    answer_content, answer_exitcode = get_answer(answer)
    average_time = 0
    for _ in range(round):
        proc = subprocess.Popen(
            [qemu_command, executable],
            stdin=open(input) if os.path.exists(input) else None,
            stdout=open(output, 'w'), stderr=open(time, 'w'))
        try:
            proc.wait(TIMEOUT)
        except subprocess.TimeoutExpired:
            proc.kill()
            return Result.TIME_LIMIT_EXCEEDED
        output_content = [line.strip() for line in open(output).read().splitlines()]
        if proc.returncode != answer_exitcode:
            print("expected ", answer_exitcode, ", got ", proc.returncode)
            return Result.WRONG_ANSWER
        if output_content != answer_content:
            print("expected:\n  ", answer_content, "\ngot:\n  ", output_content)
            return Result.WRONG_ANSWER
        if round > 1:
            print('.', end='', flush=True)
        t = get_time(time)
        if t is None:
            timing = False
        else:
            average_time += t
    if timing:
        return average_time / 1_000 / round
    else:
        return Result.PASSED


def test(config: Config, testcase: str) -> bool:
    source = os.path.join(config.testcases, f'{testcase}.sy')
    input = os.path.join(config.testcases, f'{testcase}.in')
    answer = os.path.join(config.testcases, f'{testcase}.out')
    error_log=os.path.join(config.tempdir, f'{testcase}_compile_error.log')

    assembly = os.path.join(f'{testcase}.s')
    # NOTE: 你可以在这里修改调用你的编译器的方式
    command = (f'ulimit -s unlimited && {config.compiler} {config.compiler_args} {source}'
                f' -A -m -o {assembly}')

    proc = subprocess.Popen(command, shell=True,stderr=open(error_log, 'w'))
    try:
        proc.wait(TIMEOUT)
    except subprocess.TimeoutExpired:
        proc.kill()
        print(testcase, '\033[0;31mCompiler TLE\033[0m')
        return False
    if proc.returncode != 0:
        print(testcase, '\033[0;31mCompiler Error\033[0m')
        return False
    result = run(config.tempdir, assembly, input, answer, TEST_ROUND)
    if result == Result.LINKER_ERROR:
        print(testcase, '\033[0;31mLinker Error\033[0m')
        return False
    elif result == Result.WRONG_ANSWER:
        print(testcase, '\033[0;31mWrong Answer\033[0m')
        return False
    elif result == Result.TIME_LIMIT_EXCEEDED:
        print(testcase, '\033[0;31mTime Limit Exceeded\033[0m')
        return False
    else:
        runtime = result
    # print(' ', end='')
    if not isinstance(runtime, float) or runtime == 0:
        print(testcase, '\033[0;32mPassed\033[0m')
        return True
    result = Result.GCC_ERROR \
        if os.system(
            f'riscv64-unknown-elf-gcc -xc++ -O2 -S {gcc_args}'
            f' -include runtime/sylib.h {source} -o {assembly} ') != 0 \
        and os.system(
            f'riscv64-unknown-elf-gcc -xc++ -O2 -S {gcc_args}'
            f' -include runtime/sylib.h {source} -o {assembly}') != 0 \
        else run(config.tempdir, assembly, input, answer, 1)
    if isinstance(result, Result):
        print(testcase, '\033[0;31mGCC Error\033[0m')
    else:
        print(testcase, f'\033[0;32m{runtime :.3f}ms / {result :.3f}ms'
                f' = {result / runtime :.2%}\033[0m')
    return True


if __name__ == '__main__':
    config = get_config(sys.argv[1:])
    testcases = get_testcases(config)

    if os.path.exists(config.tempdir):
        shutil.rmtree(config.tempdir)
    os.mkdir(config.tempdir)

    failed = []
    if config.parallel:
        futures = []
        f = lambda t: (t, test(config, t))
        with ThreadPoolExecutor() as executor:
            for testcase in testcases:
                futures.append(executor.submit(f, testcase))
            for future in as_completed(futures):
                testcase, ok = future.result()
                if not ok:
                    failed.append(testcase)
        failed.sort()
    else:
        for testcase in testcases:
            if not test(config, testcase):
                failed.append(testcase)
    info = '\033[0;34m[info]\033[0m {}'
    if not failed:
        print(info.format('All Passed'))
    else:
        for testcase in failed:
            print(info.format(f'`{testcase}` Failed'))
