; module
@k#0 = global int, 4
define i32 @main(){
B0:
  %r1 = add i32 0, 3389 ; loadint
  %r2 = loadaddr @k#0
  store i32 %r1, ptr %r2
  br label %B1

B1:
  %r3 = loadaddr @k#0
  %r4 = load i32, ptr %r3
  %r5 = add i32 0, 10000 ; loadint
  %r6 = icmp slt i32 %r4, %r5
  br i1 %r6, label %B2, label %B3

B2:
  %r7 = loadaddr @k#0
  %r8 = load i32, ptr %r7
  %r9 = add i32 0, 1 ; loadint
  %r10 = add i32 %r8, %r9
  %r11 = loadaddr @k#0
  store i32 %r10, ptr %r11
  %r13 = add i32 0, 112 ; loadint
  br label %B4

B3:
  %r53 = add i32 0, %r52 ; assign
  %r48 = add i32 0, %r49 ; assign
  %r47 = add i32 0, %r46 ; assign
  %r44 = add i32 0, %r43 ; assign
  %r40 = loadaddr @k#0
  %r41 = load i32, ptr %r40
  ret i32 %r41

B4:
  %r49 = phi i32 [ %r13, %B2 ], [ %r50, %B9 ]
  %r52 = add i32 0, %r51 ; assign
  %r46 = add i32 0, %r45 ; assign
  %r43 = add i32 0, %r42 ; assign
  %r15 = add i32 0, 10 ; loadint
  %r16 = icmp sgt i32 %r49, %r15
  br i1 %r16, label %B5, label %B6

B5:
  %r18 = add i32 0, 88 ; loadint
  %r19 = sub i32 %r49, %r18
  br label %B7

B6:
  %r38 = call i32 @putint(i32 %r49)
  br label %B3

B7:
  %r21 = add i32 0, 1000 ; loadint
  %r22 = icmp slt i32 %r19, %r21
  br i1 %r22, label %B8, label %B9

B8:
  %r24 = add i32 0, 9 ; loadint
  %r26 = add i32 0, 11 ; loadint
  %r27 = add i32 0, 10 ; loadint
  %r30 = sub i32 %r19, %r27
  %r32 = add i32 0, 11 ; loadint
  %r35 = add i32 %r30, %r32
  %r37 = add i32 %r35, %r26
  br label %B9

B9:
  %r51 = phi i32 [ %r52, %B7 ], [ %r26, %B8 ]
  %r50 = phi i32 [ %r19, %B7 ], [ %r37, %B8 ]
  %r45 = phi i32 [ %r46, %B7 ], [ %r32, %B8 ]
  %r42 = phi i32 [ %r43, %B7 ], [ %r27, %B8 ]
  br label %B4

}
