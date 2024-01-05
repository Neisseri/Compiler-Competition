; module
define i32 @main(){
B0:
  %r6 = add i32 0, 5 ; loadint
  %r7 = add i32 0, 5 ; loadint
  %r8 = add i32 0, 1 ; loadint
  %r9 = add i32 0, 2 ; loadint
  %r11 = add i32 0, 0 ; loadint
  %r10 = sub i32 %r11, %r9
  %r12 = add i32 0, 2 ; loadint
  br label %B1

B1:
  %r15 = add i32 0, 1 ; loadint
  %r16 = mul i32 %r10, %r15
  %r17 = add i32 0, 2 ; loadint
  %r18 = sdiv i32 %r16, %r17
  %r19 = add i32 0, 0 ; loadint
  %r20 = icmp slt i32 %r18, %r19
  br i1 %r20, label %B2, label %B3

B2:
  %r36 = add i32 0, 1 ; loadint
  br label %B4

B3:
  %r24 = sub i32 %r6, %r7
  %r25 = add i32 0, 0 ; loadint
  %r26 = icmp ne i32 %r24, %r25
  br i1 %r26, label %B5, label %B6

B4:
  %r71 = phi i32 [ %r70, %B7 ]
  %r69 = phi i32 [ %r36, %B2 ], [ %r34, %B7 ]
  br i1 %r71, label %B8, label %B9

B5:
  %r28 = add i32 0, 3 ; loadint
  %r29 = add i32 %r8, %r28
  %r30 = add i32 0, 2 ; loadint
  %r31 = srem i32 %r29, %r30
  %r32 = add i32 0, 0 ; loadint
  %r33 = icmp ne i32 %r31, %r32
  br label %B7

B6:
  %r34 = add i32 0, 0 ; loadint
  br label %B7

B7:
  %r70 = phi i32 [ %r33, %B5 ], [ %r34, %B6 ]
  br label %B4

B8:
  %r38 = call i32 @putint(i32 %r12)
  br label %B9

B9:
  br label %B10

B10:
  %r42 = add i32 0, 2 ; loadint
  %r43 = srem i32 %r10, %r42
  %r44 = add i32 0, 67 ; loadint
  %r45 = add i32 %r43, %r44
  %r46 = add i32 0, 0 ; loadint
  %r47 = icmp slt i32 %r45, %r46
  br i1 %r47, label %B11, label %B12

B11:
  %r63 = add i32 0, 1 ; loadint
  br label %B13

B12:
  %r51 = sub i32 %r6, %r7
  %r52 = add i32 0, 0 ; loadint
  %r53 = icmp ne i32 %r51, %r52
  br i1 %r53, label %B14, label %B15

B13:
  %r74 = phi i32 [ %r73, %B16 ]
  %r72 = phi i32 [ %r63, %B11 ], [ %r61, %B16 ]
  br i1 %r74, label %B17, label %B18

B14:
  %r55 = add i32 0, 2 ; loadint
  %r56 = add i32 %r8, %r55
  %r57 = add i32 0, 2 ; loadint
  %r58 = srem i32 %r56, %r57
  %r59 = add i32 0, 0 ; loadint
  %r60 = icmp ne i32 %r58, %r59
  br label %B16

B15:
  %r61 = add i32 0, 0 ; loadint
  br label %B16

B16:
  %r73 = phi i32 [ %r60, %B14 ], [ %r61, %B15 ]
  br label %B13

B17:
  %r65 = add i32 0, 4 ; loadint
  %r66 = call i32 @putint(i32 %r65)
  br label %B18

B18:
  %r75 = phi i32 [ %r12, %B13 ], [ %r65, %B17 ]
  %r68 = add i32 0, 0 ; loadint
  ret i32 %r68

}
