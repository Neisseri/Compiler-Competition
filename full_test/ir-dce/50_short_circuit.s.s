; module
@g#0 = global int 0, 4
define i32 @main(){
B2:
  %r1 = alloca int, 4
  %r2 = call i32 @getint()
  store i32 %r2, ptr %r1
  br label %B3

B3:
  %r3 = alloca int, 4
  %r4 = load i32, ptr %r1
  %r5 = add i32 0, 10 ; loadint
  %r6 = icmp sgt i32 %r4, %r5
  br i1 %r6, label %B4, label %B5

B4:
  %r8 = load i32, ptr %r1
  %r7 = call i32 @func(i32 %r8)
  store i32 %r7, ptr %r3
  br label %B6

B5:
  %r9 = add i32 0, 0 ; loadint
  store i32 %r9, ptr %r3
  br label %B6

B6:
  %r10 = load i32, ptr %r3
  br i1 %r10, label %B7, label %B8

B7:
  %r11 = add i32 0, 1 ; loadint
  store i32 %r11, ptr %r1
  br label %B9

B8:
  %r12 = add i32 0, 0 ; loadint
  store i32 %r12, ptr %r1
  br label %B9

B9:
  %r13 = call i32 @getint()
  store i32 %r13, ptr %r1
  br label %B10

B10:
  %r14 = alloca int, 4
  %r15 = load i32, ptr %r1
  %r16 = add i32 0, 11 ; loadint
  %r17 = icmp sgt i32 %r15, %r16
  br i1 %r17, label %B11, label %B12

B11:
  %r19 = load i32, ptr %r1
  %r18 = call i32 @func(i32 %r19)
  store i32 %r18, ptr %r14
  br label %B13

B12:
  %r20 = add i32 0, 0 ; loadint
  store i32 %r20, ptr %r14
  br label %B13

B13:
  %r21 = load i32, ptr %r14
  br i1 %r21, label %B14, label %B15

B14:
  %r22 = add i32 0, 1 ; loadint
  store i32 %r22, ptr %r1
  br label %B16

B15:
  %r23 = add i32 0, 0 ; loadint
  store i32 %r23, ptr %r1
  br label %B16

B16:
  %r24 = call i32 @getint()
  store i32 %r24, ptr %r1
  br label %B17

B17:
  %r25 = alloca int, 4
  %r26 = load i32, ptr %r1
  %r27 = add i32 0, 99 ; loadint
  %r28 = icmp sle i32 %r26, %r27
  br i1 %r28, label %B18, label %B19

B18:
  %r31 = add i32 0, 1 ; loadint
  store i32 %r31, ptr %r25
  br label %B20

B19:
  %r30 = load i32, ptr %r1
  %r29 = call i32 @func(i32 %r30)
  store i32 %r29, ptr %r25
  br label %B20

B20:
  %r32 = load i32, ptr %r25
  br i1 %r32, label %B21, label %B22

B21:
  %r33 = add i32 0, 1 ; loadint
  store i32 %r33, ptr %r1
  br label %B23

B22:
  %r34 = add i32 0, 0 ; loadint
  store i32 %r34, ptr %r1
  br label %B23

B23:
  %r35 = call i32 @getint()
  store i32 %r35, ptr %r1
  br label %B24

B24:
  %r36 = alloca int, 4
  %r37 = load i32, ptr %r1
  %r38 = add i32 0, 100 ; loadint
  %r39 = icmp sle i32 %r37, %r38
  br i1 %r39, label %B25, label %B26

B25:
  %r42 = add i32 0, 1 ; loadint
  store i32 %r42, ptr %r36
  br label %B27

B26:
  %r41 = load i32, ptr %r1
  %r40 = call i32 @func(i32 %r41)
  store i32 %r40, ptr %r36
  br label %B27

B27:
  %r43 = load i32, ptr %r36
  br i1 %r43, label %B28, label %B29

B28:
  %r44 = add i32 0, 1 ; loadint
  store i32 %r44, ptr %r1
  br label %B30

B29:
  %r45 = add i32 0, 0 ; loadint
  store i32 %r45, ptr %r1
  br label %B30

B30:
  br label %B31

B31:
  %r46 = alloca int, 4
  %r48 = add i32 0, 99 ; loadint
  %r47 = call i32 @func(i32 %r48)
  %r50 = add i32 0, 0 ; loadint
  %r49 = icmp eq i32 %r50, %r47
  br i1 %r49, label %B32, label %B33

B32:
  %r52 = add i32 0, 100 ; loadint
  %r51 = call i32 @func(i32 %r52)
  store i32 %r51, ptr %r46
  br label %B34

B33:
  %r53 = add i32 0, 0 ; loadint
  store i32 %r53, ptr %r46
  br label %B34

B34:
  %r54 = load i32, ptr %r46
  br i1 %r54, label %B35, label %B36

B35:
  %r55 = add i32 0, 1 ; loadint
  store i32 %r55, ptr %r1
  br label %B37

B36:
  %r56 = add i32 0, 0 ; loadint
  store i32 %r56, ptr %r1
  br label %B37

B37:
  %r57 = add i32 0, 0 ; loadint
  ret i32 %r57

}
define i32 @func(i32){
B0:
  %r2 = alloca int, 4
  store i32 %r1, ptr %r2
  %r3 = loadaddr @g#0
  %r4 = load i32, ptr %r3
  %r5 = load i32, ptr %r2
  %r6 = add i32 %r4, %r5
  %r7 = loadaddr @g#0
  store i32 %r6, ptr %r7
  %r9 = loadaddr @g#0
  %r10 = load i32, ptr %r9
  %r8 = call i32 @putint(i32 %r10)
  %r11 = loadaddr @g#0
  %r12 = load i32, ptr %r11
  ret i32 %r12

}
