import os
import subprocess

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
        for file in files:
            if file.endswith(".s"):
                file_path = os.path.join(root, file)
                output_file_name = os.path.basename(file).split(".")[0]
                output_file_path = os.path.join(output_folder, f"{output_file_name}.ans")
                compile_and_run_riscv(file_path, output_file_path)

if __name__ == "__main__":
    riscv_folder_path = "riscv"  # 替换为你的riscv文件夹路径
    output_folder = "output"  # 替换为你的输出文件夹路径
    executable_folder = "executable"  # 替换为你的可执行文件夹路径

    # 创建输出文件夹（如果不存在）
    os.makedirs(output_folder, exist_ok=True)
    os.makedirs(executable_folder, exist_ok=True)

    traverse_and_compile_riscv(riscv_folder_path, output_folder)
