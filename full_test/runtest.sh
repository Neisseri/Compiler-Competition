
if [ $# -eq 0 ]; then
    echo "Usage: $0 <testcase dir>"
    exit 1
fi

filename=$1
# 移除第一个参数（文件名），剩下的都是编译选项
shift


rm -rf ir ast riscv ir_origin llvm_s ir_dce ir_cp
mkdir llvm_s

python3 test_ir.py -t "$1" -c "$*"

