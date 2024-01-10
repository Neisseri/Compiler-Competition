; module
define i32 @main(){
B2:
  %r5 = add i32 0, 0 ; loadint
  %r7 = add i32 0, 0 ; loadint
  br label %B3

B3:
  %r67 = phi i32 [ %r5, %B2 ], [ %r66, %B8 ]
  %r64 = phi i32 [ %r5, %B2 ], [ %r63, %B8 ]
  %r61 = phi i32 [ %r5, %B2 ], [ %r60, %B8 ]
  %r58 = phi i32 [ %r5, %B2 ], [ %r57, %B8 ]
  %r55 = phi i32 [ %r5, %B2 ], [ %r54, %B8 ]
  %r52 = phi i32 [ %r5, %B2 ], [ %r51, %B8 ]
  %r50 = phi i32 [ %r7, %B2 ], [ %r43, %B8 ]
  %r49 = phi i32 [ %r5, %B2 ], [ %r48, %B8 ]
  %r46 = phi i32 [ %r5, %B2 ], [ %r12, %B8 ]
  %r45 = phi i32 [ %r5, %B2 ], [ %r11, %B8 ]
  %r9 = add i32 0, 2 ; loadint
  %tmpcmp10 = icmp slt i32 %r50, %r9
  %r10 = zext i1 %tmpcmp10 to i32
  %tmpconbr10 = trunc i32 %r10 to i1
  br i1 %tmpconbr10, label %B4, label %B5

B4:
  %r11 = add i32 0, 1 ; loadint
  %r12 = add i32 0, 2 ; loadint
  br label %B6

B5:
  %r44 = add i32 0, 0 ; loadint
  ret i32 %r44

B6:
  %r13 = add i32 0, 0 ; loadint
  %tmpconbr13 = trunc i32 %r13 to i1
  br i1 %tmpconbr13, label %B7, label %B8

B7:
  %r17 = add i32 %r11, %r12
  br label %B9

B8:
  %r66 = phi i32 [ %r67, %B6 ], [ %r65, %B29 ]
  %r63 = phi i32 [ %r64, %B6 ], [ %r62, %B29 ]
  %r60 = phi i32 [ %r61, %B6 ], [ %r59, %B29 ]
  %r57 = phi i32 [ %r58, %B6 ], [ %r56, %B29 ]
  %r54 = phi i32 [ %r55, %B6 ], [ %r53, %B29 ]
  %r51 = phi i32 [ %r52, %B6 ], [ %r17, %B29 ]
  %r48 = phi i32 [ %r49, %B6 ], [ %r47, %B29 ]
  %r42 = add i32 0, 2 ; loadint
  %r43 = add i32 %r50, %r42
  br label %B3

B9:
  %r19 = add i32 0, 0 ; loadint
  %tmpconbr19 = trunc i32 %r19 to i1
  br i1 %tmpconbr19, label %B10, label %B11

B10:
  %r20 = add i32 0, 0 ; loadint
  br label %B12

B11:
  %r21 = add i32 0, 0 ; loadint
  br label %B12

B12:
  %r53 = phi i32 [ %r20, %B10 ], [ %r21, %B11 ]
  %tmpconbr53 = trunc i32 %r53 to i1
  br i1 %tmpconbr53, label %B13, label %B14

B13:
  br label %B14

B14:
  br label %B15

B15:
  %r24 = add i32 0, 0 ; loadint
  %tmpconbr24 = trunc i32 %r24 to i1
  br i1 %tmpconbr24, label %B16, label %B17

B16:
  %r25 = add i32 0, 0 ; loadint
  br label %B18

B17:
  %r26 = add i32 0, 0 ; loadint
  br label %B18

B18:
  %r56 = phi i32 [ %r25, %B16 ], [ %r26, %B17 ]
  %tmpconbr56 = trunc i32 %r56 to i1
  br i1 %tmpconbr56, label %B19, label %B20

B19:
  %r28 = call i32 @init()
  br label %B20

B20:
  br label %B21

B21:
  %r31 = add i32 0, 0 ; loadint
  %tmpconbr31 = trunc i32 %r31 to i1
  br i1 %tmpconbr31, label %B22, label %B23

B22:
  %r32 = add i32 0, 0 ; loadint
  br label %B24

B23:
  %r33 = add i32 0, 0 ; loadint
  br label %B24

B24:
  %r62 = phi i32 [ %r32, %B22 ], [ %r33, %B23 ]
  %tmpconbr62 = trunc i32 %r62 to i1
  br i1 %tmpconbr62, label %B25, label %B26

B25:
  %r35 = add i32 0, 0 ; loadint
  br label %B27

B26:
  %r36 = add i32 0, 0 ; loadint
  br label %B27

B27:
  %r59 = phi i32 [ %r35, %B25 ], [ %r36, %B26 ]
  %tmpconbr59 = trunc i32 %r59 to i1
  br i1 %tmpconbr59, label %B28, label %B29

B28:
  %r38 = add i32 0, 1 ; loadint
  %r40 = add i32 0, 1 ; loadint
  br label %B29

B29:
  %r65 = phi i32 [ %r67, %B27 ], [ %r40, %B28 ]
  %r47 = phi i32 [ %r49, %B27 ], [ %r38, %B28 ]
  br label %B8

}
define i32 @init(){
B0:
  %r1 = add i32 0, 0 ; loadint
  ret i32 %r1

}
