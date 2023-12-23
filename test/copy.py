#copy all files end with .out in folder_target to folder_destination
import os
import shutil

def copy_files(folder_target, folder_destination):
    for root, dirs, files in os.walk(folder_target):
        for file in files:
            if file.endswith(".out"):
                file_path = os.path.join(root, file)
                shutil.copy(file_path, folder_destination)

if __name__ == "__main__":
    folder_target = "functional"  # 替换为你的可执行文件夹路径
    folder_destination = "answer"  # 替换为你的输出文件夹路径
    os.mkdir(folder_destination)
    copy_files(folder_target, folder_destination)