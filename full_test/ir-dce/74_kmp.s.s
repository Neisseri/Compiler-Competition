; module
define i32 @main(){
B37:
  %r1 = alloca int [4096], 16384
  %r2 = alloca int [4096], 16384
  %r3 = call i32 @read_str(i32 %r1)
  %r4 = call i32 @read_str(i32 %r2)
  %r6 = call i32 @KMP(i32 %r1, i32 %r2)
  %r5 = call i32 @putint(i32 %r6)
  %r8 = add i32 0, 10 ; loadint
  %r7 = call i32 @putch(i32 %r8)
  %r9 = add i32 0, 0 ; loadint
  ret i32 %r9

}
define i32 @read_str(i32){
B28:
  %r2 = alloca int, 4
  %r3 = add i32 0, 0 ; loadint
  store i32 %r3, ptr %r2
  br label %B29

B29:
  br i1 %r4, label %B30, label %B31

B30:
  %r5 = call i32 @getch()
  %r6 = add i32 0, 4 ; loadint
  %r7 = load i32, ptr %r2
  %r8 = mul i32 %r7, %r6
  %r9 = add i32 %r1, %r8
  store i32 %r5, ptr %r9
  br label %B32

B31:
  %r20 = add i32 0, 0 ; loadint
  %r21 = add i32 0, 4 ; loadint
  %r22 = load i32, ptr %r2
  %r23 = mul i32 %r22, %r21
  %r24 = add i32 %r1, %r23
  store i32 %r20, ptr %r24
  %r25 = load i32, ptr %r2
  ret i32 %r25

B32:
  %r10 = add i32 0, 4 ; loadint
  %r11 = load i32, ptr %r2
  %r12 = mul i32 %r11, %r10
  %r13 = add i32 %r1, %r12
  %r14 = load i32, ptr %r13
  %r15 = add i32 0, 10 ; loadint
  %r16 = icmp eq i32 %r14, %r15
  br i1 %r16, label %B33, label %B34

B33:
  br label %B31

B34:
  %r17 = load i32, ptr %r2
  %r18 = add i32 0, 1 ; loadint
  %r19 = add i32 %r17, %r18
  store i32 %r19, ptr %r2
  br label %B29

}
define i32 @KMP(i32, i32){
B12:
  %r3 = alloca int [4096], 16384
  %r4 = call@get_next(i32 %r1, i32 %r3)
  %r5 = alloca int, 4
  %r6 = add i32 0, 0 ; loadint
  store i32 %r6, ptr %r5
  %r7 = alloca int, 4
  %r8 = add i32 0, 0 ; loadint
  store i32 %r8, ptr %r7
  br label %B13

B13:
  %r9 = add i32 0, 4 ; loadint
  %r10 = load i32, ptr %r7
  %r11 = mul i32 %r10, %r9
  %r12 = add i32 %r2, %r11
  %r13 = load i32, ptr %r12
  br i1 %r13, label %B14, label %B15

B14:
  br label %B16

B15:
  %r55 = add i32 0, 1 ; loadint
  %r57 = add i32 0, 0 ; loadint
  %r56 = sub i32 %r57, %r55
  ret i32 %r56

B16:
  %r14 = add i32 0, 4 ; loadint
  %r15 = load i32, ptr %r5
  %r16 = mul i32 %r15, %r14
  %r17 = add i32 %r1, %r16
  %r18 = load i32, ptr %r17
  %r19 = add i32 0, 4 ; loadint
  %r20 = load i32, ptr %r7
  %r21 = mul i32 %r20, %r19
  %r22 = add i32 %r2, %r21
  %r23 = load i32, ptr %r22
  %r24 = icmp eq i32 %r18, %r23
  br i1 %r24, label %B17, label %B18

B17:
  %r25 = load i32, ptr %r5
  %r26 = add i32 0, 1 ; loadint
  %r27 = add i32 %r25, %r26
  store i32 %r27, ptr %r5
  %r28 = load i32, ptr %r7
  %r29 = add i32 0, 1 ; loadint
  %r30 = add i32 %r28, %r29
  store i32 %r30, ptr %r7
  br label %B20

B18:
  %r39 = add i32 0, 4 ; loadint
  %r40 = load i32, ptr %r5
  %r41 = mul i32 %r40, %r39
  %r42 = add i32 %r3, %r41
  %r43 = load i32, ptr %r42
  store i32 %r43, ptr %r5
  br label %B24

B19:
  br label %B13

B20:
  %r31 = add i32 0, 4 ; loadint
  %r32 = load i32, ptr %r5
  %r33 = mul i32 %r32, %r31
  %r34 = add i32 %r1, %r33
  %r35 = load i32, ptr %r34
  %r37 = add i32 0, 0 ; loadint
  %r36 = icmp eq i32 %r37, %r35
  br i1 %r36, label %B21, label %B22

B21:
  %r38 = load i32, ptr %r7
  ret i32 %r38

B22:
  br label %B19

B24:
  %r44 = load i32, ptr %r5
  %r45 = add i32 0, 1 ; loadint
  %r47 = add i32 0, 0 ; loadint
  %r46 = sub i32 %r47, %r45
  %r48 = icmp eq i32 %r44, %r46
  br i1 %r48, label %B25, label %B26

B25:
  %r49 = load i32, ptr %r5
  %r50 = add i32 0, 1 ; loadint
  %r51 = add i32 %r49, %r50
  store i32 %r51, ptr %r5
  %r52 = load i32, ptr %r7
  %r53 = add i32 0, 1 ; loadint
  %r54 = add i32 %r52, %r53
  store i32 %r54, ptr %r7
  br label %B26

B26:
  br label %B19

}
define void @get_next(i32, i32){
B0:
  %r3 = add i32 0, 1 ; loadint
  %r5 = add i32 0, 0 ; loadint
  %r4 = sub i32 %r5, %r3
  %r6 = add i32 0, 4 ; loadint
  %r7 = add i32 0, 0 ; loadint
  %r8 = mul i32 %r7, %r6
  %r9 = add i32 %r2, %r8
  store i32 %r4, ptr %r9
  %r10 = alloca int, 4
  %r11 = add i32 0, 0 ; loadint
  store i32 %r11, ptr %r10
  %r12 = alloca int, 4
  %r13 = add i32 0, 1 ; loadint
  %r15 = add i32 0, 0 ; loadint
  %r14 = sub i32 %r15, %r13
  store i32 %r14, ptr %r12
  br label %B1

B1:
  %r16 = add i32 0, 4 ; loadint
  %r17 = load i32, ptr %r10
  %r18 = mul i32 %r17, %r16
  %r19 = add i32 %r1, %r18
  %r20 = load i32, ptr %r19
  br i1 %r20, label %B2, label %B3

B2:
  br label %B4

B3:
  %r56 = add i32 0, 0 ; loadint
  ret i32 %r56

B4:
  %r21 = alloca int, 4
  %r22 = load i32, ptr %r12
  %r23 = add i32 0, 1 ; loadint
  %r25 = add i32 0, 0 ; loadint
  %r24 = sub i32 %r25, %r23
  %r26 = icmp eq i32 %r22, %r24
  br i1 %r26, label %B5, label %B6

B5:
  %r38 = add i32 0, 1 ; loadint
  store i32 %r38, ptr %r21
  br label %B7

B6:
  %r27 = add i32 0, 4 ; loadint
  %r28 = load i32, ptr %r10
  %r29 = mul i32 %r28, %r27
  %r30 = add i32 %r1, %r29
  %r31 = load i32, ptr %r30
  %r32 = add i32 0, 4 ; loadint
  %r33 = load i32, ptr %r12
  %r34 = mul i32 %r33, %r32
  %r35 = add i32 %r1, %r34
  %r36 = load i32, ptr %r35
  %r37 = icmp eq i32 %r31, %r36
  store i32 %r37, ptr %r21
  br label %B7

B7:
  %r39 = load i32, ptr %r21
  br i1 %r39, label %B8, label %B9

B8:
  %r40 = load i32, ptr %r12
  %r41 = add i32 0, 1 ; loadint
  %r42 = add i32 %r40, %r41
  store i32 %r42, ptr %r12
  %r43 = load i32, ptr %r10
  %r44 = add i32 0, 1 ; loadint
  %r45 = add i32 %r43, %r44
  store i32 %r45, ptr %r10
  %r46 = load i32, ptr %r12
  %r47 = add i32 0, 4 ; loadint
  %r48 = load i32, ptr %r10
  %r49 = mul i32 %r48, %r47
  %r50 = add i32 %r2, %r49
  store i32 %r46, ptr %r50
  br label %B10

B9:
  %r51 = add i32 0, 4 ; loadint
  %r52 = load i32, ptr %r12
  %r53 = mul i32 %r52, %r51
  %r54 = add i32 %r2, %r53
  %r55 = load i32, ptr %r54
  store i32 %r55, ptr %r12
  br label %B10

B10:
  br label %B1

}
