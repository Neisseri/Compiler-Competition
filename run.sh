#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

filename=$1

rm -rf ir ast riscv

build/compiler -f "$filename" -A > "runtime.log" 2>&1

riscv64-unknown-elf-gcc -march=rv32im -mabi=ilp32 "riscv/test.out.s" -o "a.out"
qemu-riscv32 a.out

exit_status=$?

echo "Return Value: $exit_status"
