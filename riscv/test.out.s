
.text
.global main

main:
B0:
addi sp, sp, -168
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
addi t1, sp, 52
addi t2, sp, 56
addi s1, sp, 60
addi a0, sp, 64
li a1, 5
sw a1, 0(t0)
li a2, 5
sw a2, 0(t1)
li a3, 1
sw a3, 0(t2)
li a4, 2
li a5, 0
sub a6, a5, a4
sw a6, 0(s1)
lw a7, 0(s1)
li s2, 1
mul s3, a7, s2
li s4, 2
div s5, s3, s4
lw s6, 0(t0)
lw s7, 0(t1)
sub s8, s6, s7
add s9, s5, s8
lw s10, 0(t2)
li s11, 3
add t3, s10, s11
li t4, 0
sub t5, t4, t3
li t6, 2
sw s3, 68(sp)
sw t3, 72(sp)
lw t3, 0(sp)
sub s3, s9, t3
sw s3, 0(a0)
sw a7, 76(sp)
lw a7, 0(s1)
sw s7, 80(sp)
li s7, 2
sw t1, 84(sp)
li t1, 67
sw t1, 88(sp)
sw s2, 92(sp)
lw s2, 0(sp)
add t1, s2, t1
sw s6, 96(sp)
lw s6, 0(t0)
sw t1, 100(sp)
lw t1, 0(t1)
sw a3, 104(sp)
sub a3, s6, t1
sw t2, 108(sp)
li t2, 0
sw s1, 112(sp)
sub s1, t2, a3
sw t0, 116(sp)
add t0, t1, s1
sw s7, 120(sp)
lw s7, 0(t2)
sw t6, 124(sp)
li t6, 2
sw s4, 128(sp)
add s4, s7, t6
sw t3, 132(sp)
li t3, 2
sw a6, 136(sp)
li a6, 0
sw a6, 140(sp)
sw t5, 144(sp)
lw t5, 0(sp)
sub a6, a6, t5
sw a3, 148(sp)
sub a3, t0, a6
sw a3, 0(a0)
sw a4, 152(sp)
lw a4, 0(a0)
sw s1, 156(sp)
li s1, 3
sw s1, 160(sp)
add s1, a4, s1
sw s1, 0(a0)
sw s6, 164(sp)
li s6, 0
mv a0, s6
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
addi sp, sp, 168
ret

