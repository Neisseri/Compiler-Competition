; module
@ans#0 = global int [50], 200
@sum#0 = global int 0, 4
@n#0 = global int, 4
@row#0 = global int [50], 200
@line1#0 = global int [50], 200
@line2#0 = global int [100], 400
define i32 @main(){
B26:
  %r1 = alloca int, 4
  %r2 = call i32 @getint()
  store i32 %r2, ptr %r1
  br label %B27

B27:
  %r3 = load i32, ptr %r1
  %r4 = add i32 0, 0 ; loadint
  %r5 = icmp sgt i32 %r3, %r4
  br i1 %r5, label %B28, label %B29

B28:
  %r6 = call i32 @getint()
  %r7 = loadaddr @n#0
  store i32 %r6, ptr %r7
  %r9 = add i32 0, 1 ; loadint
  %r8 = call@f(i32 %r9)
  %r10 = load i32, ptr %r1
  %r11 = add i32 0, 1 ; loadint
  %r12 = sub i32 %r10, %r11
  store i32 %r12, ptr %r1
  br label %B27

B29:
  %r13 = loadaddr @sum#0
  %r14 = load i32, ptr %r13
  ret i32 %r14

}
define void @f(i32){
B9:
  %r2 = alloca int, 4
  store i32 %r1, ptr %r2
  %r3 = alloca int, 4
  %r4 = add i32 0, 1 ; loadint
  store i32 %r4, ptr %r3
  br label %B10

B10:
  %r5 = load i32, ptr %r3
  %r6 = loadaddr @n#0
  %r7 = load i32, ptr %r6
  %r8 = icmp sle i32 %r5, %r7
  br i1 %r8, label %B11, label %B12

B11:
  br label %B13

B12:
  %r121 = add i32 0, 0 ; loadint
  ret i32 %r121

B13:
  %r9 = alloca int, 4
  %r10 = alloca int, 4
  %r11 = loadaddr @row#0
  %r12 = add i32 0, 4 ; loadint
  %r13 = load i32, ptr %r3
  %r14 = mul i32 %r13, %r12
  %r15 = add i32 %r11, %r14
  %r16 = load i32, ptr %r15
  %r17 = add i32 0, 1 ; loadint
  %r18 = icmp ne i32 %r16, %r17
  br i1 %r18, label %B14, label %B15

B14:
  %r19 = loadaddr @line1#0
  %r20 = add i32 0, 4 ; loadint
  %r21 = load i32, ptr %r2
  %r22 = load i32, ptr %r3
  %r23 = add i32 %r21, %r22
  %r24 = mul i32 %r23, %r20
  %r25 = add i32 %r19, %r24
  %r26 = load i32, ptr %r25
  %r27 = add i32 0, 0 ; loadint
  %r28 = icmp eq i32 %r26, %r27
  store i32 %r28, ptr %r10
  br label %B16

B15:
  %r29 = add i32 0, 0 ; loadint
  store i32 %r29, ptr %r10
  br label %B16

B16:
  %r30 = load i32, ptr %r10
  br i1 %r30, label %B17, label %B18

B17:
  %r31 = loadaddr @line2#0
  %r32 = add i32 0, 4 ; loadint
  %r33 = loadaddr @n#0
  %r34 = load i32, ptr %r33
  %r35 = load i32, ptr %r2
  %r36 = add i32 %r34, %r35
  %r37 = load i32, ptr %r3
  %r38 = sub i32 %r36, %r37
  %r39 = mul i32 %r38, %r32
  %r40 = add i32 %r31, %r39
  %r41 = load i32, ptr %r40
  %r43 = add i32 0, 0 ; loadint
  %r42 = icmp eq i32 %r43, %r41
  store i32 %r42, ptr %r9
  br label %B19

B18:
  %r44 = add i32 0, 0 ; loadint
  store i32 %r44, ptr %r9
  br label %B19

B19:
  %r45 = load i32, ptr %r9
  br i1 %r45, label %B20, label %B21

B20:
  %r46 = load i32, ptr %r3
  %r47 = loadaddr @ans#0
  %r48 = loadaddr @ans#0
  %r49 = add i32 0, 4 ; loadint
  %r50 = load i32, ptr %r2
  %r51 = mul i32 %r50, %r49
  %r52 = add i32 %r48, %r51
  store i32 %r46, ptr %r52
  br label %B22

B21:
  %r118 = load i32, ptr %r3
  %r119 = add i32 0, 1 ; loadint
  %r120 = add i32 %r118, %r119
  store i32 %r120, ptr %r3
  br label %B10

B22:
  %r53 = load i32, ptr %r2
  %r54 = loadaddr @n#0
  %r55 = load i32, ptr %r54
  %r56 = icmp eq i32 %r53, %r55
  br i1 %r56, label %B23, label %B24

B23:
  %r57 = call@printans()
  br label %B24

B24:
  %r58 = add i32 0, 1 ; loadint
  %r59 = loadaddr @row#0
  %r60 = loadaddr @row#0
  %r61 = add i32 0, 4 ; loadint
  %r62 = load i32, ptr %r3
  %r63 = mul i32 %r62, %r61
  %r64 = add i32 %r60, %r63
  store i32 %r58, ptr %r64
  %r65 = add i32 0, 1 ; loadint
  %r66 = loadaddr @line1#0
  %r67 = loadaddr @line1#0
  %r68 = add i32 0, 4 ; loadint
  %r69 = load i32, ptr %r2
  %r70 = load i32, ptr %r3
  %r71 = add i32 %r69, %r70
  %r72 = mul i32 %r71, %r68
  %r73 = add i32 %r67, %r72
  store i32 %r65, ptr %r73
  %r74 = add i32 0, 1 ; loadint
  %r75 = loadaddr @line2#0
  %r76 = loadaddr @line2#0
  %r77 = add i32 0, 4 ; loadint
  %r78 = loadaddr @n#0
  %r79 = load i32, ptr %r78
  %r80 = load i32, ptr %r2
  %r81 = add i32 %r79, %r80
  %r82 = load i32, ptr %r3
  %r83 = sub i32 %r81, %r82
  %r84 = mul i32 %r83, %r77
  %r85 = add i32 %r76, %r84
  store i32 %r74, ptr %r85
  %r87 = load i32, ptr %r2
  %r88 = add i32 0, 1 ; loadint
  %r89 = add i32 %r87, %r88
  %r86 = call i32 @f(i32 %r89)
  %r90 = add i32 0, 0 ; loadint
  %r91 = loadaddr @row#0
  %r92 = loadaddr @row#0
  %r93 = add i32 0, 4 ; loadint
  %r94 = load i32, ptr %r3
  %r95 = mul i32 %r94, %r93
  %r96 = add i32 %r92, %r95
  store i32 %r90, ptr %r96
  %r97 = add i32 0, 0 ; loadint
  %r98 = loadaddr @line1#0
  %r99 = loadaddr @line1#0
  %r100 = add i32 0, 4 ; loadint
  %r101 = load i32, ptr %r2
  %r102 = load i32, ptr %r3
  %r103 = add i32 %r101, %r102
  %r104 = mul i32 %r103, %r100
  %r105 = add i32 %r99, %r104
  store i32 %r97, ptr %r105
  %r106 = add i32 0, 0 ; loadint
  %r107 = loadaddr @line2#0
  %r108 = loadaddr @line2#0
  %r109 = add i32 0, 4 ; loadint
  %r110 = loadaddr @n#0
  %r111 = load i32, ptr %r110
  %r112 = load i32, ptr %r2
  %r113 = add i32 %r111, %r112
  %r114 = load i32, ptr %r3
  %r115 = sub i32 %r113, %r114
  %r116 = mul i32 %r115, %r109
  %r117 = add i32 %r108, %r116
  store i32 %r106, ptr %r117
  br label %B21

}
define void @printans(){
B0:
  %r1 = loadaddr @sum#0
  %r2 = load i32, ptr %r1
  %r3 = add i32 0, 1 ; loadint
  %r4 = add i32 %r2, %r3
  %r5 = loadaddr @sum#0
  store i32 %r4, ptr %r5
  %r6 = alloca int, 4
  %r7 = add i32 0, 1 ; loadint
  store i32 %r7, ptr %r6
  br label %B1

B1:
  %r8 = load i32, ptr %r6
  %r9 = loadaddr @n#0
  %r10 = load i32, ptr %r9
  %r11 = icmp sle i32 %r8, %r10
  br i1 %r11, label %B2, label %B3

B2:
  %r13 = loadaddr @ans#0
  %r14 = add i32 0, 4 ; loadint
  %r15 = load i32, ptr %r6
  %r16 = mul i32 %r15, %r14
  %r17 = add i32 %r13, %r16
  %r18 = load i32, ptr %r17
  %r12 = call i32 @putint(i32 %r18)
  br label %B4

B3:

B4:
  %r19 = load i32, ptr %r6
  %r20 = loadaddr @n#0
  %r21 = load i32, ptr %r20
  %r22 = icmp eq i32 %r19, %r21
  br i1 %r22, label %B5, label %B6

B5:
  %r24 = add i32 0, 10 ; loadint
  %r23 = call i32 @putch(i32 %r24)
  %r25 = add i32 0, 0 ; loadint
  ret i32 %r25

B6:
  %r27 = add i32 0, 32 ; loadint
  %r26 = call i32 @putch(i32 %r27)
  br label %B7

B7:
  %r28 = load i32, ptr %r6
  %r29 = add i32 0, 1 ; loadint
  %r30 = add i32 %r28, %r29
  store i32 %r30, ptr %r6
  br label %B1

}
