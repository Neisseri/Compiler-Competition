
.text
.global main

main:
B0:
addi sp, sp, -60
sw ra, 44(sp)

B1:
addi t0, sp, 48
li t1, 1
sw t1, 0(t0)
addi t1, sp, 52
li t2, 2
sw t2, 0(t1)
addi t2, sp, 56
lw t0, 0(t0)
lw t1, 0(t1)
add t0, t0, t1
sw t0, 0(t2)
lw a0, 0(t2)
j B2

B2:
lw ra, 44(sp)
addi sp, sp, 60
ret

