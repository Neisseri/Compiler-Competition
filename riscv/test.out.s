
.text
.global main

main:
B0:
addi sp, sp, -48
sw ra, 44(sp)

B1:
li t0, 3
mv a0, t0
j B2

B2:
lw ra, 44(sp)
addi sp, sp, 48
ret

