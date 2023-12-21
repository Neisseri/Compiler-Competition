
.text
.global main

func:
B2:
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

B3:
addi t0, sp, 88
lw t5, 0(t6)
sw t5, 0(t0)
addi t1, sp, 92
lw t5, 4(t6)
sw t5, 0(t1)
addi t2, sp, 96
lw t5, 8(t6)
sw t5, 0(t2)
addi s1, sp, 100
lw t5, 12(t6)
sw t5, 0(s1)
addi a0, sp, 104
lw t5, 16(t6)
sw t5, 0(a0)
addi a1, sp, 108
lw t5, 20(t6)
sw t5, 0(a1)
addi a2, sp, 112
lw t5, 24(t6)
sw t5, 0(a2)
addi a3, sp, 116
lw t5, 28(t6)
sw t5, 0(a3)
addi a4, sp, 120
lw t5, 32(t6)
sw t5, 0(a4)
addi a5, sp, 124
lw t5, 36(t6)
sw t5, 0(a5)
lw a6, 0(t0)
lw a7, 0(t1)
add s2, a6, a7
lw s3, 0(t2)
add s4, s2, s3
lw s5, 0(s1)
add s6, s4, s5
lw s7, 0(a0)
add s8, s6, s7
lw s9, 0(a1)
add s10, s8, s9
lw s11, 0(a2)
add t3, s10, s11
lw t4, 0(a3)
add t5, t3, t4
sw s3, 128(sp)
lw s3, 0(a4)
sw t3, 132(sp)
add t3, t5, s3
sw a7, 136(sp)
lw a7, 0(a5)
sw s7, 140(sp)
mul s7, t3, a7
mv a0, s7
j B4

B4:
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
addi sp, sp, 144
ret

main:
B0:
addi sp, sp, -48
sw ra, 44(sp)
sw s1, 0(sp)

B1:
li t0, 1
li t1, 2
li t2, 3
li s1, 4
li a0, 5
li a1, 6
li a2, 7
li a3, 8
li a4, 9
li a5, 10
addi sp, sp, -40
sw t0, 0(sp)
sw t1, 4(sp)
sw t2, 8(sp)
sw s1, 12(sp)
sw a0, 16(sp)
sw a1, 20(sp)
sw a2, 24(sp)
sw a3, 28(sp)
sw a4, 32(sp)
sw a5, 36(sp)
mv t6, sp
call func
mv a6, a0
addi sp, sp, 40
mv a0, a6
j B5

B5:
lw s1, 36(sp)
lw ra, 44(sp)
addi sp, sp, 48
ret

