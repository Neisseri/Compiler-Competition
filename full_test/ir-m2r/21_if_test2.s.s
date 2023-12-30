; module
define i32 @main(){
B24:
  %r2 = call i32 @ifElseIf()
  %r1 = call i32 @putint(i32 %r2)
  %r3 = add i32 0, 0 ; loadint
  ret i32 %r3

}
define i32 @ifElseIf(){
B0:
  %r2 = add i32 0, 5 ; loadint
  %r4 = add i32 0, 10 ; loadint
  br label %B1

B1:
  %r7 = add i32 0, 6 ; loadint
  %r8 = icmp eq i32 %r2, %r7
  br i1 %r8, label %B2, label %B3

B2:
  %r12 = add i32 0, 1 ; loadint
  br label %B4

B3:
  %r10 = add i32 0, 11 ; loadint
  %r11 = icmp eq i32 %r4, %r10
  br label %B4

B4:
  %r48 = phi i32 [ %r12, %B2 ], [ %r11, %B3 ]
  br i1 %r48, label %B5, label %B6

B5:
  ret i32 %r2

B6:
  br label %B9

B7:
  ret i32 %r43

B9:
  %r17 = add i32 0, 10 ; loadint
  %r18 = icmp eq i32 %r4, %r17
  br i1 %r18, label %B10, label %B11

B10:
  %r20 = add i32 0, 1 ; loadint
  %r21 = icmp eq i32 %r2, %r20
  br label %B12

B11:
  %r22 = add i32 0, 0 ; loadint
  br label %B12

B12:
  %r45 = phi i32 [ %r21, %B10 ], [ %r22, %B11 ]
  br i1 %r45, label %B13, label %B14

B13:
  %r24 = add i32 0, 25 ; loadint
  br label %B15

B14:
  br label %B16

B15:
  %r43 = phi i32 [ %r24, %B13 ], [ %r44, %B22 ]
  %r47 = add i32 0, %r46 ; assign
  br label %B7

B16:
  %r27 = add i32 0, 10 ; loadint
  %r28 = icmp eq i32 %r4, %r27
  br i1 %r28, label %B17, label %B18

B17:
  %r30 = add i32 0, 5 ; loadint
  %r32 = add i32 0, 0 ; loadint
  %r31 = sub i32 %r32, %r30
  %r33 = icmp eq i32 %r2, %r31
  br label %B19

B18:
  %r34 = add i32 0, 0 ; loadint
  br label %B19

B19:
  %r46 = phi i32 [ %r33, %B17 ], [ %r34, %B18 ]
  br i1 %r46, label %B20, label %B21

B20:
  %r37 = add i32 0, 15 ; loadint
  %r38 = add i32 %r2, %r37
  br label %B22

B21:
  %r41 = add i32 0, 0 ; loadint
  %r40 = sub i32 %r41, %r2
  br label %B22

B22:
  %r44 = phi i32 [ %r38, %B20 ], [ %r40, %B21 ]
  br label %B15

}
