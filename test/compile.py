import os
import subprocess
import argparse

error_log_file="error.log"

def compile_file(file_path, compiler_path, *args):
    file_name = os.path.basename(file_path).split(".")[0]
    command = [compiler_path, *args, "-f", file_path , "-o", file_name]
    try:
        subprocess.run(command, check=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE, timeout=5)
    except subprocess.CalledProcessError as e:
        with open(error_log_file, "a", encoding="utf-8") as error_log:
            error_log.write(f"compile error: {file_path}\n")
            error_log.write(str(e))
    except subprocess.TimeoutExpired as e:
        with open(error_log_file, "a", encoding="utf-8") as error_log:
            error_log.write(f"compile timeout: {file_path}\n")
            error_log.write(str(e))

def traverse_and_compile(folder_path, compiler_path, *args):
    for root, dirs, files in os.walk(folder_path):
        for file in sorted(files):
            if file.endswith(".c") or file.endswith(".sy"):
                file_path = os.path.join(root, file)
                compile_file(file_path, compiler_path, *args)

def compile_and_run_riscv(file_path, output_file_path):
    # Compile .s file with riscv64-unknown-elf-gcc
    file_name = os.path.basename(file_path).split(".")[0]
    executable_name = f"{file_name}.out"
    executable_file_path = os.path.join("executable", executable_name)
    compile_command = ["riscv64-unknown-elf-gcc", "-march=rv32im", "-mabi=ilp32", file_path,"-o",executable_file_path]
    try:
        subprocess.run(compile_command,check=True,stdout=subprocess.PIPE,stderr=subprocess.PIPE,timeout=5)
    except subprocess.CalledProcessError as e:
        with open(output_file_path, "w",encoding="utf-8") as output_file:
            # write details to output file
            output_file.write("compile error\n")
            output_file.write(str(e))
        return

    # Run the compiled executable with qemu-riscv32
    run_command = ["qemu-riscv32", executable_file_path]
    result = subprocess.run(run_command,check=False,stdout=subprocess.PIPE,stderr=subprocess.PIPE)

    # Get the return code from the subprocess result
    return_code = result.returncode

    # Save the return code to the specified output file
    with open(output_file_path, "w",encoding="utf-8") as output_file:
        output_file.write(str(return_code))

def traverse_and_compile_riscv(folder_path, output_folder):
    for root, dirs, files in os.walk(folder_path):
        for file in sorted(files):
            if file.endswith(".s"):
                file_path = os.path.join(root, file)
                output_file_name = os.path.basename(file).split(".")[0]
                output_file_path = os.path.join(output_folder, f"{output_file_name}.ans")
                compile_and_run_riscv(file_path, output_file_path)

def clean_folder(folder_path):
    if not os.path.exists(folder_path):
        return
    for root, dirs, files in os.walk(folder_path):
        for file in files:
            file_path = os.path.join(root, file)
            os.remove(file_path)

if __name__ == "__main__":
    # using argparse to get arguments below
    # compiler_path = "../build/compiler"  # 替换为你的compiler可执行文件路径
    # test_folder_path = "test/functional"  # 替换为你的测试文件夹路径
    # riscv_folder_path = "riscv"  # 替换为你的riscv文件夹路径
    # output_folder = "output"  # 替换为你的输出文件夹路径
    # executable_folder = "executable"  # 替换为你的可执行文件夹路径
        # 创建输出文件夹（如果不存在）
    parser = argparse.ArgumentParser()
    parser.add_argument("-c", "--compiler", help="compiler path", default="../build/compiler")
    parser.add_argument("-t", "--test", help="test folder path", default="functional")
    parser.add_argument("-r", "--riscv", help="riscv folder path", default="riscv")
    parser.add_argument("-o", "--output", help="output folder path", default="output")
    parser.add_argument("-e", "--executable", help="executable folder path", default="executable")
    parser.add_argument("-a", "--arguments", help="arguments for compiler", nargs="*", default=[])
    args = parser.parse_args()
    compiler_path = args.compiler
    test_folder_path = args.test
    riscv_folder_path = args.riscv
    output_folder = args.output
    executable_folder = args.executable
    arguments = args.arguments
    if len(arguments) == 0:
        parser.print_help()
    arguments = ["-r"]  # 替换为额外参数列表,目前只是指定了用riscv输出
    os.makedirs(output_folder, exist_ok=True)
    os.makedirs(executable_folder, exist_ok=True)

    clean_folder(output_folder)
    clean_folder(executable_folder)
    clean_folder(riscv_folder_path)
    os.remove(error_log_file)

    traverse_and_compile(test_folder_path, compiler_path, *arguments)
    print("compile finished")
    traverse_and_compile_riscv(riscv_folder_path, output_folder)
    print("riscv compile finished")

