
if [ $# -eq 0 ]; then
    echo "Usage: $0 <testcase dir>"
    exit 1
fi

filename=$1

rm -rf ir ast riscv

python3 test.py -t testcases/$1

