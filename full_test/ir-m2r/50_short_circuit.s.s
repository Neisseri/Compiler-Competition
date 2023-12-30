; module
@g#0 = global int 0, 4
define i32 @main(){
B2:
  %r2 = call i32 @getint()
  br label %B3

B3:
  %r5 = add i32 0, 10 ; loadint
  %r6 = icmp sgt i32 %r2, %r5
  br i1 %r6, label %B4, label %B5

B4:
  %r7 = call i32 @func(i32 %r2)
  br label %B6

B5:
  %r9 = add i32 0, 0 ; loadint
  br label %B6

B6:
  %r65 = phi i32 [ %r7, %B4 ], [ %r9, %B5 ]
  br i1 %r65, label %B7, label %B8

B7:
  %r11 = add i32 0, 1 ; loadint
  br label %B9

B8:
  %r12 = add i32 0, 0 ; loadint
  br label %B9

B9:
  %r58 = phi i32 [ %r11, %B7 ], [ %r12, %B8 ]
  %r13 = call i32 @getint()
  br label %B10

B10:
  %r16 = add i32 0, 11 ; loadint
  %r17 = icmp sgt i32 %r58, %r16
  br i1 %r17, label %B11, label %B12

B11:
  %r18 = call i32 @func(i32 %r58)
  br label %B13

B12:
  %r20 = add i32 0, 0 ; loadint
  br label %B13

B13:
  %r63 = phi i32 [ %r18, %B11 ], [ %r20, %B12 ]
  br i1 %r63, label %B14, label %B15

B14:
  %r22 = add i32 0, 1 ; loadint
  br label %B16

B15:
  %r23 = add i32 0, 0 ; loadint
  br label %B16

B16:
  %r59 = phi i32 [ %r22, %B14 ], [ %r23, %B15 ]
  %r24 = call i32 @getint()
  br label %B17

B17:
  %r27 = add i32 0, 99 ; loadint
  %r28 = icmp sle i32 %r59, %r27
  br i1 %r28, label %B18, label %B19

B18:
  %r31 = add i32 0, 1 ; loadint
  br label %B20

B19:
  %r29 = call i32 @func(i32 %r59)
  br label %B20

B20:
  %r64 = phi i32 [ %r31, %B18 ], [ %r29, %B19 ]
  br i1 %r64, label %B21, label %B22

B21:
  %r33 = add i32 0, 1 ; loadint
  br label %B23

B22:
  %r34 = add i32 0, 0 ; loadint
  br label %B23

B23:
  %r60 = phi i32 [ %r33, %B21 ], [ %r34, %B22 ]
  %r35 = call i32 @getint()
  br label %B24

B24:
  %r38 = add i32 0, 100 ; loadint
  %r39 = icmp sle i32 %r60, %r38
  br i1 %r39, label %B25, label %B26

B25:
  %r42 = add i32 0, 1 ; loadint
  br label %B27

B26:
  %r40 = call i32 @func(i32 %r60)
  br label %B27

B27:
  %r66 = phi i32 [ %r42, %B25 ], [ %r40, %B26 ]
  br i1 %r66, label %B28, label %B29

B28:
  %r44 = add i32 0, 1 ; loadint
  br label %B30

B29:
  %r45 = add i32 0, 0 ; loadint
  br label %B30

B30:
  %r61 = phi i32 [ %r44, %B28 ], [ %r45, %B29 ]
  br label %B31

B31:
  %r48 = add i32 0, 99 ; loadint
  %r47 = call i32 @func(i32 %r48)
  %r50 = add i32 0, 0 ; loadint
  %r49 = icmp eq i32 %r50, %r47
  br i1 %r49, label %B32, label %B33

B32:
  %r52 = add i32 0, 100 ; loadint
  %r51 = call i32 @func(i32 %r52)
  br label %B34

B33:
  %r53 = add i32 0, 0 ; loadint
  br label %B34

B34:
  %r67 = phi i32 [ %r51, %B32 ], [ %r53, %B33 ]
  br i1 %r67, label %B35, label %B36

B35:
  %r55 = add i32 0, 1 ; loadint
  br label %B37

B36:
  %r56 = add i32 0, 0 ; loadint
  br label %B37

B37:
  %r62 = phi i32 [ %r55, %B35 ], [ %r56, %B36 ]
  %r57 = add i32 0, 0 ; loadint
  ret i32 %r57

}
define i32 @func(i32){
B0:
  %r3 = loadaddr @g#0
  %r4 = load i32, ptr %r3
  %r6 = add i32 %r4, %r1
  %r7 = loadaddr @g#0
  store i32 %r6, ptr %r7
  %r9 = loadaddr @g#0
  %r10 = load i32, ptr %r9
  %r8 = call i32 @putint(i32 %r10)
  %r11 = loadaddr @g#0
  %r12 = load i32, ptr %r11
  ret i32 %r12

}
