
.text
.global main

main:
B0:
addi sp, sp, -64
sw ra, 44(sp)
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
sw t1, 0(t0)
addi t2, sp, 52
li s1, 2
sw s1, 0(t2)
addi a0, sp, 56
lw a1, 0(t0)
lw a2, 0(t2)
add a3, a1, a2
sw a3, 0(a0)
addi a4, sp, 60
lw a5, 0(a0)
lw a6, 0(t2)
div a7, a5, a6
lw s2, 0(t0)
lw s3, 0(t2)
mul s4, s2, s3
sub s5, a7, s4
lw s6, 0(t2)
lw s7, 0(t0)
lw s9, 0(sp)
sub s8, s5, s9
sw s8, 0(a4)
lw s10, 0(a4)
mv a0, s10
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
lw ra, 44(sp)
addi sp, sp, 64
ret

