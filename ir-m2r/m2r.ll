; module
define i32 @main(){
B2:
  %r2 = add i32 0, 1 ; loadint
  %r4 = add i32 0, 1 ; loadint
  br label %B3

B3:
  %r76 = phi i32 [ %r75, %B23 ]
  %r72 = phi i32 [ %r2, %B2 ], [ %r6, %B23 ]
  %r71 = phi i32 [ %r70, %B23 ]
  %r67 = phi i32 [ %r66, %B23 ]
  %r63 = phi i32 [ %r62, %B23 ]
  %r60 = phi i32 [ %r11, %B23 ]
  %r58 = phi i32 [ %r59, %B23 ]
  %r57 = phi i32 [ %r56, %B23 ]
  %r53 = phi i32 [ %r52, %B23 ]
  %r51 = phi i32 [ %r50, %B23 ]
  br i1 %r72, label %B4, label %B5

B4:
  %r6 = add i32 0, 0 ; loadint
  %r8 = add i32 0, 0 ; loadint
  %r9 = call i32 @init()
  %r11 = add i32 0, 0 ; loadint
  br label %B6

B5:
  %r49 = add i32 0, 0 ; loadint
  ret i32 %r49

B6:
  %r75 = phi i32 [ %r76, %B4 ], [ %r74, %B11 ]
  %r70 = phi i32 [ %r71, %B4 ], [ %r69, %B11 ]
  %r66 = phi i32 [ %r67, %B4 ], [ %r65, %B11 ]
  %r62 = phi i32 [ %r63, %B4 ], [ %r61, %B11 ]
  %r59 = phi i32 [ %r8, %B4 ], [ %r47, %B11 ]
  %r56 = phi i32 [ %r57, %B4 ], [ %r55, %B11 ]
  %r52 = phi i32 [ %r53, %B4 ], [ %r18, %B11 ]
  %r50 = phi i32 [ %r51, %B4 ], [ %r16, %B11 ]
  %r13 = add i32 0, 3 ; loadint
  %r14 = icmp slt i32 %r59, %r13
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
  %r74 = phi i32 [ %r75, %B9 ], [ %r73, %B20 ]
  %r69 = phi i32 [ %r70, %B9 ], [ %r68, %B20 ]
  %r65 = phi i32 [ %r66, %B9 ], [ %r64, %B20 ]
  %r61 = phi i32 [ %r62, %B9 ], [ %r16, %B20 ]
  %r55 = phi i32 [ %r56, %B9 ], [ %r54, %B20 ]
  %r46 = add i32 0, 1 ; loadint
  %r47 = add i32 %r59, %r46
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
  %r68 = phi i32 [ %r33, %B13 ], [ %r34, %B14 ]
  br i1 %r68, label %B16, label %B17

B16:
  %r36 = add i32 0, 0 ; loadint
  %r38 = icmp eq i32 %r36, %r11
  br label %B18

B17:
  %r39 = add i32 0, 0 ; loadint
  br label %B18

B18:
  %r64 = phi i32 [ %r38, %B16 ], [ %r39, %B17 ]
  br i1 %r64, label %B19, label %B20

B19:
  %r42 = add i32 0, 1 ; loadint
  %r44 = add i32 0, 1 ; loadint
  br label %B20

B20:
  %r73 = phi i32 [ %r75, %B18 ], [ %r44, %B19 ]
  %r54 = phi i32 [ %r56, %B18 ], [ %r42, %B19 ]
  br label %B11

B21:
  %r48 = add i32 0, 1 ; loadint
  br i1 %r48, label %B22, label %B23

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
