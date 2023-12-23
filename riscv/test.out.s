
.text
.global main

ifElseIf:
B2:
addi sp, sp, -56
sw ra, 44(sp)
sw s1, 0(sp)

B3:
addi t0, sp, 48
li t1, 5
sw t1, 0(t0)
addi t2, sp, 52
li s1, 10
sw s1, 0(t2)
lw a0, 0(t0)
mv a0, a0
j B4

B4:
lw s1, 0(sp)
lw ra, 44(sp)
addi sp, sp, 56
ret

main:
B0:
addi sp, sp, -48
sw ra, 44(sp)

B1:
li t0, 0
mv a0, t0
j B5

B5:
lw ra, 44(sp)
addi sp, sp, 48
ret

