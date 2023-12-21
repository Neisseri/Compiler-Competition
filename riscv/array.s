
.text
.global main

main:
B0:
addi sp, sp, -144
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
sw s3, 76(sp)
mul s3, s10, t5
sw t3, 80(sp)
li t3, 0
sw a7, 84(sp)
mul a7, t3, s3
sw s7, 88(sp)
add s7, t4, a7
sw t1, 92(sp)
lw t1, 0(s7)
sw t1, 96(sp)
li t1, 4
sw s2, 100(sp)
li s2, 1
sw s6, 104(sp)
mul s6, s2, t1
sw t1, 108(sp)
add t1, t0, s6
sw a3, 112(sp)
li a3, 2
sw t2, 116(sp)
mul t2, t1, a3
sw s1, 120(sp)
li s1, 1
sw t0, 124(sp)
mul t0, s1, t2
sw s7, 128(sp)
add s7, t1, t0
sw s5, 132(sp)
lw s5, 0(s7)
sw s4, 136(sp)
add s4, t1, s5
sw s4, 0(s9)
sw t3, 140(sp)
lw t3, 0(s9)
mv a0, t3
j B2

B2:
lw s1, 0(sp)
lw s2, 4(sp)
lw s3, 8(sp)
lw s4, 12(sp)
lw s5, 16(sp)
lw s6, 20(sp)
lw s7, 24(sp)
lw s8, 28(sp)
lw s9, 32(sp)
lw s10, 36(sp)
lw s11, 40(sp)
lw ra, 44(sp)
addi sp, sp, 144
ret

