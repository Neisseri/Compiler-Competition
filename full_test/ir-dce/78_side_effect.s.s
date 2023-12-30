; module
@a#0 = global int -1, 4
@b#0 = global int 1, 4
define i32 @main(){
B2:
  %r1 = alloca int, 4
  %r2 = add i32 0, 5 ; loadint
  store i32 %r2, ptr %r1
  br label %B3

B3:
  %r3 = load i32, ptr %r1
  %r4 = add i32 0, 0 ; loadint
  %r5 = icmp sge i32 %r3, %r4
  br i1 %r5, label %B4, label %B5

B4:
  br label %B6

B5:
  %r55 = loadaddr @a#0
  %r56 = load i32, ptr %r55
  %r54 = call i32 @putint(i32 %r56)
  %r58 = add i32 0, 32 ; loadint
  %r57 = call i32 @putch(i32 %r58)
  %r60 = loadaddr @b#0
  %r61 = load i32, ptr %r60
  %r59 = call i32 @putint(i32 %r61)
  %r63 = add i32 0, 10 ; loadint
  %r62 = call i32 @putch(i32 %r63)
  %r64 = loadaddr @a#0
  %r65 = load i32, ptr %r64
  ret i32 %r65

B6:
  %r6 = alloca int, 4
  %r7 = alloca int, 4
  %r8 = call i32 @inc_a()
  br i1 %r8, label %B7, label %B8

B7:
  %r9 = call i32 @inc_a()
  store i32 %r9, ptr %r7
  br label %B9

B8:
  %r10 = add i32 0, 0 ; loadint
  store i32 %r10, ptr %r7
  br label %B9

B9:
  %r11 = load i32, ptr %r7
  br i1 %r11, label %B10, label %B11

B10:
  %r12 = call i32 @inc_a()
  store i32 %r12, ptr %r6
  br label %B12

B11:
  %r13 = add i32 0, 0 ; loadint
  store i32 %r13, ptr %r6
  br label %B12

B12:
  %r14 = load i32, ptr %r6
  br i1 %r14, label %B13, label %B14

B13:
  %r16 = loadaddr @a#0
  %r17 = load i32, ptr %r16
  %r15 = call i32 @putint(i32 %r17)
  %r19 = add i32 0, 32 ; loadint
  %r18 = call i32 @putch(i32 %r19)
  %r21 = loadaddr @b#0
  %r22 = load i32, ptr %r21
  %r20 = call i32 @putint(i32 %r22)
  %r24 = add i32 0, 10 ; loadint
  %r23 = call i32 @putch(i32 %r24)
  br label %B14

B14:
  br label %B15

B15:
  %r25 = alloca int, 4
  %r26 = call i32 @inc_a()
  %r27 = add i32 0, 14 ; loadint
  %r28 = icmp slt i32 %r26, %r27
  br i1 %r28, label %B16, label %B17

B16:
  %r38 = add i32 0, 1 ; loadint
  store i32 %r38, ptr %r25
  br label %B18

B17:
  %r29 = alloca int, 4
  %r30 = call i32 @inc_a()
  br i1 %r30, label %B19, label %B20

B18:
  %r39 = load i32, ptr %r25
  br i1 %r39, label %B22, label %B23

B19:
  %r31 = call i32 @inc_a()
  %r32 = call i32 @inc_a()
  %r33 = sub i32 %r31, %r32
  %r34 = add i32 0, 1 ; loadint
  %r35 = add i32 %r33, %r34
  store i32 %r35, ptr %r29
  br label %B21

B20:
  %r36 = add i32 0, 0 ; loadint
  store i32 %r36, ptr %r29
  br label %B21

B21:
  %r37 = load i32, ptr %r29
  store i32 %r37, ptr %r25
  br label %B18

B22:
  %r41 = loadaddr @a#0
  %r42 = load i32, ptr %r41
  %r40 = call i32 @putint(i32 %r42)
  %r44 = add i32 0, 10 ; loadint
  %r43 = call i32 @putch(i32 %r44)
  %r45 = loadaddr @b#0
  %r46 = load i32, ptr %r45
  %r47 = add i32 0, 2 ; loadint
  %r48 = mul i32 %r46, %r47
  %r49 = loadaddr @b#0
  store i32 %r48, ptr %r49
  br label %B24

B23:
  %r50 = call i32 @inc_a()
  br label %B24

B24:
  %r51 = load i32, ptr %r1
  %r52 = add i32 0, 1 ; loadint
  %r53 = sub i32 %r51, %r52
  store i32 %r53, ptr %r1
  br label %B3

}
define i32 @inc_a(){
B0:
  %r1 = alloca int, 4
  %r2 = loadaddr @a#0
  %r3 = load i32, ptr %r2
  store i32 %r3, ptr %r1
  %r4 = load i32, ptr %r1
  %r5 = add i32 0, 1 ; loadint
  %r6 = add i32 %r4, %r5
  store i32 %r6, ptr %r1
  %r7 = load i32, ptr %r1
  %r8 = loadaddr @a#0
  store i32 %r7, ptr %r8
  %r9 = loadaddr @a#0
  %r10 = load i32, ptr %r9
  ret i32 %r10

}
