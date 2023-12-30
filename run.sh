#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

./build.sh

filename=$1

rm -rf ir ast riscv

build/compiler -d -f "$filename" -A > "runtime.log" 2>&1

riscv64-unknown-elf-gcc -march=rv32gc -mabi=ilp32f riscv/test.s full_test/runtime/libsysy.a -o test.exec
qemu-riscv32 test.exec

exit_status=$?

echo "Return Value: $exit_status"
