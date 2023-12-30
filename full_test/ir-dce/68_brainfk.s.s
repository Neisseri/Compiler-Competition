; module
@TAPE_LEN#0 = global const int 65536, 4
@BUFFER_LEN#0 = global const int 32768, 4
@tape#0 = global int [65536], 262144
@program#0 = global int [32768], 131072
@ptr#0 = global int 0, 4
define void @interpret(i32){
B5:
  %r2 = alloca int, 4
  %r3 = alloca int, 4
  %r4 = alloca int, 4
  %r5 = add i32 0, 0 ; loadint
  store i32 %r5, ptr %r4
  br label %B6

B6:
  %r6 = add i32 0, 4 ; loadint
  %r7 = load i32, ptr %r4
  %r8 = mul i32 %r7, %r6
  %r9 = add i32 %r1, %r8
  %r10 = load i32, ptr %r9
  br i1 %r10, label %B7, label %B8

B7:
  %r11 = add i32 0, 4 ; loadint
  %r12 = load i32, ptr %r4
  %r13 = mul i32 %r12, %r11
  %r14 = add i32 %r1, %r13
  %r15 = load i32, ptr %r14
  store i32 %r15, ptr %r2
  br label %B9

B8:
  %r132 = add i32 0, 0 ; loadint
  ret i32 %r132

B9:
  %r16 = load i32, ptr %r2
  %r17 = add i32 0, 62 ; loadint
  %r18 = icmp eq i32 %r16, %r17
  br i1 %r18, label %B10, label %B11

B10:
  %r19 = loadaddr @ptr#0
  %r20 = load i32, ptr %r19
  %r21 = add i32 0, 1 ; loadint
  %r22 = add i32 %r20, %r21
  %r23 = loadaddr @ptr#0
  store i32 %r22, ptr %r23
  br label %B12

B11:
  br label %B13

B12:
  %r129 = load i32, ptr %r4
  %r130 = add i32 0, 1 ; loadint
  %r131 = add i32 %r129, %r130
  store i32 %r131, ptr %r4
  br label %B6

B13:
  %r24 = load i32, ptr %r2
  %r25 = add i32 0, 60 ; loadint
  %r26 = icmp eq i32 %r24, %r25
  br i1 %r26, label %B14, label %B15

B14:
  %r27 = loadaddr @ptr#0
  %r28 = load i32, ptr %r27
  %r29 = add i32 0, 1 ; loadint
  %r30 = sub i32 %r28, %r29
  %r31 = loadaddr @ptr#0
  store i32 %r30, ptr %r31
  br label %B16

B15:
  br label %B17

B16:
  br label %B12

B17:
  %r32 = load i32, ptr %r2
  %r33 = add i32 0, 43 ; loadint
  %r34 = icmp eq i32 %r32, %r33
  br i1 %r34, label %B18, label %B19

B18:
  %r35 = loadaddr @tape#0
  %r36 = add i32 0, 4 ; loadint
  %r37 = loadaddr @ptr#0
  %r38 = load i32, ptr %r37
  %r39 = mul i32 %r38, %r36
  %r40 = add i32 %r35, %r39
  %r41 = load i32, ptr %r40
  %r42 = add i32 0, 1 ; loadint
  %r43 = add i32 %r41, %r42
  %r44 = loadaddr @tape#0
  %r45 = loadaddr @tape#0
  %r46 = add i32 0, 4 ; loadint
  %r47 = loadaddr @ptr#0
  %r48 = load i32, ptr %r47
  %r49 = mul i32 %r48, %r46
  %r50 = add i32 %r45, %r49
  store i32 %r43, ptr %r50
  br label %B20

B19:
  br label %B21

B20:
  br label %B16

B21:
  %r51 = load i32, ptr %r2
  %r52 = add i32 0, 45 ; loadint
  %r53 = icmp eq i32 %r51, %r52
  br i1 %r53, label %B22, label %B23

B22:
  %r54 = loadaddr @tape#0
  %r55 = add i32 0, 4 ; loadint
  %r56 = loadaddr @ptr#0
  %r57 = load i32, ptr %r56
  %r58 = mul i32 %r57, %r55
  %r59 = add i32 %r54, %r58
  %r60 = load i32, ptr %r59
  %r61 = add i32 0, 1 ; loadint
  %r62 = sub i32 %r60, %r61
  %r63 = loadaddr @tape#0
  %r64 = loadaddr @tape#0
  %r65 = add i32 0, 4 ; loadint
  %r66 = loadaddr @ptr#0
  %r67 = load i32, ptr %r66
  %r68 = mul i32 %r67, %r65
  %r69 = add i32 %r64, %r68
  store i32 %r62, ptr %r69
  br label %B24

B23:
  br label %B25

B24:
  br label %B20

B25:
  %r70 = load i32, ptr %r2
  %r71 = add i32 0, 46 ; loadint
  %r72 = icmp eq i32 %r70, %r71
  br i1 %r72, label %B26, label %B27

B26:
  %r74 = loadaddr @tape#0
  %r75 = add i32 0, 4 ; loadint
  %r76 = loadaddr @ptr#0
  %r77 = load i32, ptr %r76
  %r78 = mul i32 %r77, %r75
  %r79 = add i32 %r74, %r78
  %r80 = load i32, ptr %r79
  %r73 = call i32 @putch(i32 %r80)
  br label %B28

B27:
  br label %B29

B28:
  br label %B24

B29:
  %r81 = load i32, ptr %r2
  %r82 = add i32 0, 44 ; loadint
  %r83 = icmp eq i32 %r81, %r82
  br i1 %r83, label %B30, label %B31

B30:
  %r84 = call i32 @getch()
  %r85 = loadaddr @tape#0
  %r86 = loadaddr @tape#0
  %r87 = add i32 0, 4 ; loadint
  %r88 = loadaddr @ptr#0
  %r89 = load i32, ptr %r88
  %r90 = mul i32 %r89, %r87
  %r91 = add i32 %r86, %r90
  store i32 %r84, ptr %r91
  br label %B32

B31:
  br label %B33

B32:
  br label %B28

B33:
  %r92 = alloca int, 4
  %r93 = load i32, ptr %r2
  %r94 = add i32 0, 93 ; loadint
  %r95 = icmp eq i32 %r93, %r94
  br i1 %r95, label %B34, label %B35

B34:
  %r96 = loadaddr @tape#0
  %r97 = add i32 0, 4 ; loadint
  %r98 = loadaddr @ptr#0
  %r99 = load i32, ptr %r98
  %r100 = mul i32 %r99, %r97
  %r101 = add i32 %r96, %r100
  %r102 = load i32, ptr %r101
  store i32 %r102, ptr %r92
  br label %B36

B35:
  %r103 = add i32 0, 0 ; loadint
  store i32 %r103, ptr %r92
  br label %B36

B36:
  %r104 = load i32, ptr %r92
  br i1 %r104, label %B37, label %B38

B37:
  %r105 = add i32 0, 1 ; loadint
  store i32 %r105, ptr %r3
  br label %B39

B38:
  br label %B32

B39:
  %r106 = load i32, ptr %r3
  %r107 = add i32 0, 0 ; loadint
  %r108 = icmp sgt i32 %r106, %r107
  br i1 %r108, label %B40, label %B41

B40:
  %r109 = load i32, ptr %r4
  %r110 = add i32 0, 1 ; loadint
  %r111 = sub i32 %r109, %r110
  store i32 %r111, ptr %r4
  %r112 = add i32 0, 4 ; loadint
  %r113 = load i32, ptr %r4
  %r114 = mul i32 %r113, %r112
  %r115 = add i32 %r1, %r114
  %r116 = load i32, ptr %r115
  store i32 %r116, ptr %r2
  br label %B42

B41:
  br label %B38

B42:
  %r117 = load i32, ptr %r2
  %r118 = add i32 0, 91 ; loadint
  %r119 = icmp eq i32 %r117, %r118
  br i1 %r119, label %B43, label %B44

B43:
  %r120 = load i32, ptr %r3
  %r121 = add i32 0, 1 ; loadint
  %r122 = sub i32 %r120, %r121
  store i32 %r122, ptr %r3
  br label %B45

B44:
  br label %B46

B45:
  br label %B39

B46:
  %r123 = load i32, ptr %r2
  %r124 = add i32 0, 93 ; loadint
  %r125 = icmp eq i32 %r123, %r124
  br i1 %r125, label %B47, label %B48

B47:
  %r126 = load i32, ptr %r3
  %r127 = add i32 0, 1 ; loadint
  %r128 = add i32 %r126, %r127
  store i32 %r128, ptr %r3
  br label %B48

B48:
  br label %B45

}
define i32 @main(){
B50:
  %r1 = call@read_program()
  %r3 = loadaddr @program#0
  %r2 = call@interpret(i32 %r3)
  %r4 = add i32 0, 0 ; loadint
  ret i32 %r4

}
define void @read_program(){
B0:
  %r1 = alloca int, 4
  %r2 = add i32 0, 0 ; loadint
  store i32 %r2, ptr %r1
  %r3 = alloca int, 4
  %r4 = call i32 @getint()
  store i32 %r4, ptr %r3
  br label %B1

B1:
  %r5 = load i32, ptr %r1
  %r6 = load i32, ptr %r3
  %r7 = icmp slt i32 %r5, %r6
  br i1 %r7, label %B2, label %B3

B2:
  %r8 = call i32 @getch()
  %r9 = loadaddr @program#0
  %r10 = loadaddr @program#0
  %r11 = add i32 0, 4 ; loadint
  %r12 = load i32, ptr %r1
  %r13 = mul i32 %r12, %r11
  %r14 = add i32 %r10, %r13
  store i32 %r8, ptr %r14
  %r15 = load i32, ptr %r1
  %r16 = add i32 0, 1 ; loadint
  %r17 = add i32 %r15, %r16
  store i32 %r17, ptr %r1
  br label %B1

B3:
  %r18 = add i32 0, 0 ; loadint
  %r19 = loadaddr @program#0
  %r20 = loadaddr @program#0
  %r21 = add i32 0, 4 ; loadint
  %r22 = load i32, ptr %r1
  %r23 = mul i32 %r22, %r21
  %r24 = add i32 %r20, %r23
  store i32 %r18, ptr %r24
  %r25 = add i32 0, 0 ; loadint
  ret i32 %r25

}
