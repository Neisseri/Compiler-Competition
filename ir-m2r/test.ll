; module
define i32 @main(){
B2:
  %r2 = add i32 0, 1 ; loadint
  %r4 = add i32 0, 1 ; loadint
  br label %B3

B3:
  %r74 = phi i32 [ %r73, %B23 ]
  %r70 = phi i32 [ %r2, %B2 ], [ %r6, %B23 ]
  %r69 = phi i32 [ %r68, %B23 ]
  %r65 = phi i32 [ %r64, %B23 ]
  %r61 = phi i32 [ %r60, %B23 ]
  %r58 = phi i32 [ %r11, %B23 ]
  %r56 = phi i32 [ %r57, %B23 ]
  %r55 = phi i32 [ %r54, %B23 ]
  %r51 = phi i32 [ %r50, %B23 ]
  %r49 = phi i32 [ %r48, %B23 ]
  br i1 %r70, label %B4, label %B5

B4:
  %r6 = add i32 0, 0 ; loadint
  %r8 = add i32 0, 0 ; loadint
  %r9 = call i32 @init()
  %r11 = add i32 0, 0 ; loadint
  br label %B6

B5:
  %r47 = add i32 0, 0 ; loadint
  ret i32 %r47

B6:
  %r73 = phi i32 [ %r74, %B4 ], [ %r72, %B11 ]
  %r68 = phi i32 [ %r69, %B4 ], [ %r67, %B11 ]
  %r64 = phi i32 [ %r65, %B4 ], [ %r63, %B11 ]
  %r60 = phi i32 [ %r61, %B4 ], [ %r59, %B11 ]
  %r57 = phi i32 [ %r8, %B4 ], [ %r45, %B11 ]
  %r54 = phi i32 [ %r55, %B4 ], [ %r53, %B11 ]
  %r50 = phi i32 [ %r51, %B4 ], [ %r18, %B11 ]
  %r48 = phi i32 [ %r49, %B4 ], [ %r16, %B11 ]
  %r13 = add i32 0, 3 ; loadint
  %r14 = icmp slt i32 %r57, %r13
  br i1 %r14, label %B7, label %B8

B7:
  %r16 = add i32 0, 1 ; loadint
  %r18 = add i32 0, 1 ; loadint
  br label %B9

B8:
  br label %B21

B9:
  %r19 = add i32 0, 1 ; loadint
  br i1 %r19, label %B10, label %B11

B10:
  br label %B12

B11:
  %r72 = phi i32 [ %r73, %B9 ], [ %r71, %B20 ]
  %r67 = phi i32 [ %r68, %B9 ], [ %r66, %B20 ]
  %r63 = phi i32 [ %r64, %B9 ], [ %r62, %B20 ]
  %r59 = phi i32 [ %r60, %B9 ], [ %r16, %B20 ]
  %r53 = phi i32 [ %r54, %B9 ], [ %r52, %B20 ]
  %r44 = add i32 0, 1 ; loadint
  %r45 = add i32 %r57, %r44
  br label %B6

B12:
  %r25 = add i32 0, 1 ; loadint
  %r27 = add i32 0, 0 ; loadint
  %r26 = sub i32 %r27, %r25
  %r28 = icmp ne i32 %r4, %r26
  br i1 %r28, label %B13, label %B14

B13:
  %r30 = add i32 0, 1 ; loadint
  %r32 = add i32 0, 0 ; loadint
  %r31 = sub i32 %r32, %r30
  %r33 = icmp ne i32 %r4, %r31
  br label %B15

B14:
  %r34 = add i32 0, 0 ; loadint
  br label %B15

B15:
  %r66 = phi i32 [ %r33, %B13 ], [ %r34, %B14 ]
  br i1 %r66, label %B16, label %B17

B16:
  %r36 = add i32 0, 1 ; loadint
  br label %B18

B17:
  %r37 = add i32 0, 0 ; loadint
  br label %B18

B18:
  %r62 = phi i32 [ %r36, %B16 ], [ %r37, %B17 ]
  br i1 %r62, label %B19, label %B20

B19:
  %r40 = add i32 0, 1 ; loadint
  %r42 = add i32 0, 1 ; loadint
  br label %B20

B20:
  %r71 = phi i32 [ %r73, %B18 ], [ %r42, %B19 ]
  %r52 = phi i32 [ %r54, %B18 ], [ %r40, %B19 ]
  br label %B11

B21:
  %r46 = add i32 0, 1 ; loadint
  br i1 %r46, label %B22, label %B23

B22:
  br label %B23

B23:
  br label %B3

}
define void @init(){
B0:
  %r1 = add i32 0, 0 ; loadint
  ret i32 %r1

}
