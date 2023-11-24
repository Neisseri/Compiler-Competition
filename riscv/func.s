
.text
.global main

func:
B2:
addi sp, sp, -64
sw ra, 44(sp)
sw s1, 36(sp)

B3:
addi t0, sp, 56
lw t5, 0(t6)
sw t5, 0(t0)
addi t1, sp, 60
lw t5, 4(t6)
sw t5, 0(t1)
lw t2, 0(t0)
lw s1, 0(t1)
add a0, t2, s1
mv a0, a0
j B4

B4:
lw s1, 36(sp)
lw ra, 44(sp)
addi sp, sp, 64
ret

main:
B0:
addi sp, sp, -48
sw ra, 44(sp)

B1:
li t0, 1
li t1, 2
addi sp, sp, -8
sw t0, 0(sp)
sw t1, 4(sp)
mv t6, sp
call func
mv t2, a0
addi sp, sp, 8
mv a0, t2
j B5

B5:
lw ra, 44(sp)
addi sp, sp, 48
ret

