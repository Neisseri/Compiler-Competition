.text
.global main

main:
B0:
addi sp, sp, -56
sw ra, 44(sp)
sw s1, 36(sp)

B1:
addi t0, sp, 48
li t1, 1
sw t1, 0(t0)
sw t0, 52(sp)
j B2

B2:
lw t1, 52(sp)
lw t0, 0(t1)
li t2, 1
sub s1, t0, t2
seqz s1, s1
beq x0, s1, B3
sw t1, 52(sp)
j B4

B3:
lw t1, 52(sp)
lw t0, 0(t1)
j B5

B4:
lw t1, 52(sp)
lw t0, 0(t1)
li t2, 1
add s1, t0, t2
sw s1, 0(t1)
lw a0, 0(t1)
j B5

B5:
lw s1, 36(sp)
lw ra, 44(sp)
addi sp, sp, 56
ret x0
