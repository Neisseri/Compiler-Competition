
.text
.global main

main:
B0:
addi sp, sp, -72
sw ra, 44(sp)
sw s9, 100(sp)
sw s8, 96(sp)
sw s7, 92(sp)
sw s6, 88(sp)
sw s5, 84(sp)
sw s4, 80(sp)
sw s3, 76(sp)
sw s2, 72(sp)
sw s1, 36(sp)

B1:
addi t0, sp, 48
li t1, 0
li t2, 0
add s1, t0, t2
sw t1, 0(s1)
li a0, 0
li a1, 4
add a2, t0, a1
sw a0, 0(a2)
li a3, 0
li a4, 8
add a5, t0, a4
sw a3, 0(a5)
li a6, 0
li a7, 12
add s2, t0, a7
sw a6, 0(s2)
li s3, 0
li s4, 16
add s5, t0, s4
sw s3, 0(s5)
li s6, 0
li s7, 20
add s8, t0, s7
sw s6, 0(s8)
li s9, 0
mv a0, s9
j B2

B2:
lw s1, 36(sp)
lw s2, 72(sp)
lw s3, 76(sp)
lw s4, 80(sp)
lw s5, 84(sp)
lw s6, 88(sp)
lw s7, 92(sp)
lw s8, 96(sp)
lw s9, 100(sp)
lw ra, 44(sp)
addi sp, sp, 72
ret

