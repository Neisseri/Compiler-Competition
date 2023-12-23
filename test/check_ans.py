#check if our ans equals to the standard ans
import os

wrong_ans_file = "wrong_ans.log"

def check_ans(our_ans, standard_ans):
    with open(our_ans, "r", encoding="utf-8") as our_ans_file:
        with open(standard_ans, "r", encoding="utf-8") as standard_ans_file:
            our_ans_content = our_ans_file.read().rstrip()
            standard_ans_content = standard_ans_file.read().rstrip()
            return our_ans_content == standard_ans_content , our_ans_content, standard_ans_content

def traverse_and_check_ans(folder_path, standard_ans_folder_path):
    for root, dirs, files in os.walk(standard_ans_folder_path):
        for file in sorted(files):
            if file.endswith(".out"):
                file_path = os.path.join(root, file)
                file_name = os.path.basename(file).split(".")[0]
                our_ans_file_path = os.path.join(folder_path, f"{file_name}.ans")
                if not os.path.exists(our_ans_file_path):
                    with open(wrong_ans_file, "a", encoding="utf-8") as wrong_ans:
                        wrong_ans.write(f"{our_ans_file_path} not found \n")
                    continue
                else:
                    correct, our_ans_content, standard_ans_content = check_ans(our_ans_file_path, file_path)
                    if not correct:
                        with open(wrong_ans_file, "a", encoding="utf-8") as wrong_ans:
                            wrong_ans.write(f"{our_ans_file_path} wrong our answer: {our_ans_content} std answer: {standard_ans_content}\n")
                    else:
                        with open(wrong_ans_file, "a", encoding="utf-8") as wrong_ans:
                            wrong_ans.write(f"{our_ans_file_path} correct\n")
if __name__ == "__main__":
    folder_path = "output"  # 替换为你的输出文件夹路径
    standard_ans_folder_path = "answer"  # 替换为你的标准输出文件夹路径
    with open(wrong_ans_file, "w", encoding="utf-8") as wrong_ans:
        wrong_ans.write("")
    traverse_and_check_ans(folder_path, standard_ans_folder_path)
    print("check finished")
