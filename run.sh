#!/bin/bash

# 检查至少提供了一个参数（文件名）
if [ $# -lt 1 ]; then
    echo "Usage: $0 <filename> [compiler options...]"
    exit 1
fi

./build.sh

# 第一个参数是文件名
filename=$1
# 移除第一个参数（文件名），剩下的都是编译选项
shift

rm -rf ir ast riscv

# 使用"$@"来传递所有剩余的参数作为编译选项
build/compiler "$@" -f "$filename" > "runtime.log" 2>&1

riscv64-unknown-elf-gcc -march=rv32gc -mabi=ilp32f riscv/test.s full_test/runtime/libsysy.a -o test.exec
qemu-riscv32 test.exec

exit_status=$?

echo "Return Value: $exit_status"
