; module
@array = global i32, i32 4
@n = global i32, i32 4
define i32 @main(){
B2:
  %r1 = alloca i32, i32 4
  %r2 = add i32 0, 1 ; loadint
  store t#4 i32 %r2, ptr %r1
  %r3 = alloca i32, i32 4
  %r4 = alloca i32, i32 4
  br label %B3

B3:
  %r5 = load t#4 i32, ptr %r1
  br i1 %r5, label %B4, label %B5

B4:
  %r6 = load t#4 i32, ptr %r1
  %r7 = add i32 0, 1 ; loadint
  %r8 = sub i32 %r6, %r7
  store t#4 i32 %r8, ptr %r1
  %r9 = add i32 0, 1 ; loadint
  %r10 = loadaddr @n#0
  store n#0 i32 %r9, ptr %r10
  %r11 = alloca i32, i32 4
  %r12 = add i32 0, 0 ; loadint
  store i#6 i32 %r12, ptr %r11
  %r13 = alloca i32, i32 4
  %r14 = add i32 0, 0 ; loadint
  store flag#6 i32 %r14, ptr %r13
  %r16 = loadaddr @n#0
  %r17 = load n#0 i32, ptr %r16
  %r15 = call i32 @init(i32 %r17)
  %r18 = alloca i32, i32 4
  %r19 = add i32 0, 17 ; loadint
  store k#6 i32 %r19, ptr %r18
  br label %B6

B5:
  %r81 = add i32 0, 0 ; loadint
  ret i32 %r81

B6:
  %r20 = load i#6 i32, ptr %r11
  %r21 = add i32 0, 10 ; loadint
  %r22 = icmp slt i32 %r20, %r21
  br i1 %r22, label %B7, label %B8

B7:
  %r23 = add i32 0, 1 ; loadint
  store a#4 i32 %r23, ptr %r3
  %r24 = add i32 0, 2 ; loadint
  store b#4 i32 %r24, ptr %r4
  br label %B9

B8:
  br label %B21

B9:
  %r25 = load flag#6 i32, ptr %r13
  %r27 = add i32 0, 0 ; loadint
  %r26 = icmp eq i32 %r27, %r25
  br i1 %r26, label %B10, label %B11

B10:
  %r28 = alloca i32, i32 4
  %r29 = loadaddr @n#0
  %r30 = load n#0 i32, ptr %r29
  %r31 = load a#4 i32, ptr %r3
  %r32 = add i32 0, 1 ; loadint
  %r33 = sub i32 %r31, %r32
  %r34 = mul i32 %r30, %r33
  %r35 = load b#4 i32, ptr %r4
  %r36 = add i32 %r34, %r35
  store loc#9 i32 %r36, ptr %r28
  br label %B12

B11:
  %r71 = load i#6 i32, ptr %r11
  %r72 = add i32 0, 1 ; loadint
  %r73 = add i32 %r71, %r72
  store i#6 i32 %r73, ptr %r11
  br label %B6

B12:
  %r37 = alloca i32, i32 4
  %r38 = alloca i32, i32 4
  %r39 = loadaddr @array#0
  %r40 = add i32 0, 4 ; loadint
  %r41 = add i32 0, 0 ; loadint
  %r42 = mul i32 %r41, %r40
  %r43 = add i32 %r39, %r42
  %r44 = load array#0 i32, ptr %r43
  %r45 = add i32 0, 1 ; loadint
  %r47 = add i32 0, 0 ; loadint
  %r46 = sub i32 %r47, %r45
  %r48 = icmp ne i32 %r44, %r46
  br i1 %r48, label %B13, label %B14

B13:
  %r49 = loadaddr @array#0
  %r50 = add i32 0, 4 ; loadint
  %r51 = load k#6 i32, ptr %r18
  %r52 = mul i32 %r51, %r50
  %r53 = add i32 %r49, %r52
  %r54 = load array#0 i32, ptr %r53
  %r55 = add i32 0, 1 ; loadint
  %r57 = add i32 0, 0 ; loadint
  %r56 = sub i32 %r57, %r55
  %r58 = icmp ne i32 %r54, %r56
  store logic_expr@#38 i32 %r58, ptr %r38
  br label %B15

B14:
  %r59 = add i32 0, 0 ; loadint
  store logic_expr@#38 i32 %r59, ptr %r38
  br label %B15

B15:
  %r60 = load logic_expr@#38 i32, ptr %r38
  br i1 %r60, label %B16, label %B17

B16:
  %r61 = add i32 0, 0 ; loadint
  %r62 = load k#6 i32, ptr %r18
  %r63 = icmp eq i32 %r61, %r62
  store logic_expr@#37 i32 %r63, ptr %r37
  br label %B18

B17:
  %r64 = add i32 0, 0 ; loadint
  store logic_expr@#37 i32 %r64, ptr %r37
  br label %B18

B18:
  %r65 = load logic_expr@#37 i32, ptr %r37
  br i1 %r65, label %B19, label %B20

B19:
  %r66 = add i32 0, 1 ; loadint
  store flag#6 i32 %r66, ptr %r13
  %r67 = alloca i32, i32 4
  %r68 = load i#6 i32, ptr %r11
  %r69 = add i32 0, 1 ; loadint
  %r70 = add i32 %r68, %r69
  store tmp#10 i32 %r70, ptr %r67
  br label %B20

B20:
  br label %B11

B21:
  %r74 = load flag#6 i32, ptr %r13
  %r76 = add i32 0, 0 ; loadint
  %r75 = icmp eq i32 %r76, %r74
  br i1 %r75, label %B22, label %B23

B22:
  %r78 = add i32 0, 1 ; loadint
  %r80 = add i32 0, 0 ; loadint
  %r79 = sub i32 %r80, %r78
  %r77 = call i32 @putint(i32 %r79)
  br label %B23

B23:
  br label %B3

}
define void @init(i32 %r1){
B0:
  %r2 = alloca i32, i32 4
  store n#1 i32 %r1, ptr %r2
  %r3 = add i32 0, 0 ; loadint
  ret i32 %r3

}
