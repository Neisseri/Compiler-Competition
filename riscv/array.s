
.text
.global main

main:
B0:
addi sp, sp, -96
sw ra, 44(sp)
sw s11, 40(sp)
sw s10, 36(sp)
sw s9, 32(sp)
sw s8, 28(sp)
sw s7, 24(sp)
sw s6, 20(sp)
sw s5, 16(sp)
sw s4, 12(sp)
sw s3, 8(sp)
sw s2, 4(sp)
sw s1, 0(sp)

B1:
addi t0, sp, 48
li t1, 1
li t2, 0
add s1, t0, t2
sw t1, 0(s1)
li a0, 2
li a1, 4
add a2, t0, a1
sw a0, 0(a2)
li a3, 3
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
addi s9, sp, 72
li s10, 4
li s11, 1
mul t3, s11, s10
add t4, t0, t3
li t5, 2
mul t6, s10, t5
sw a3, 76(sp)
li a3, 0
sw s6, 80(sp)
mul s6, a3, t6
sw a1, 84(sp)
add a1, t4, s6
sw a7, 88(sp)
lw a7, 0(a1)
sw a7, 0(s9)
sw ra, 92(sp)
lw ra, 0(s9)
mv a0, ra
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
lw s10, 104(sp)
lw s11, 108(sp)
lw ra, 44(sp)
addi sp, sp, 96
ret

