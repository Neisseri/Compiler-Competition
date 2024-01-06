; module
define i32 @main(){
B2:
  %r1 = alloca i32, i32 4
  %r2 = add i32 0, 1 ; loadint
  store t#4 i32 %r2, ptr %r1
  %r3 = alloca i32, i32 4
  %r4 = add i32 0, 1 ; loadint
  store c#4 i32 %r4, ptr %r3
  br label %B3

B3:
  %r5 = load t#4 i32, ptr %r1
  br i1 %r5, label %B4, label %B5

B4:
  %r6 = add i32 0, 0 ; loadint
  store t#4 i32 %r6, ptr %r1
  %r7 = alloca i32, i32 4
  %r8 = add i32 0, 0 ; loadint
  store i#6 i32 %r8, ptr %r7
  %r9 = call i32 @init()
  %r10 = alloca i32, i32 4
  %r11 = add i32 0, 0 ; loadint
  store k#6 i32 %r11, ptr %r10
  br label %B6

B5:
  %r49 = add i32 0, 0 ; loadint
  ret i32 %r49

B6:
  %r12 = load i#6 i32, ptr %r7
  %r13 = add i32 0, 3 ; loadint
  %r14 = icmp slt i32 %r12, %r13
  br i1 %r14, label %B7, label %B8

B7:
  %r15 = alloca i32, i32 4
  %r16 = add i32 0, 1 ; loadint
  store a#8 i32 %r16, ptr %r15
  %r17 = alloca i32, i32 4
  %r18 = add i32 0, 1 ; loadint
  store b#8 i32 %r18, ptr %r17
  br label %B9

B8:
  br label %B21

B9:
  %r19 = add i32 0, 1 ; loadint
  br i1 %r19, label %B10, label %B11

B10:
  %r20 = alloca i32, i32 4
  %r21 = load a#8 i32, ptr %r15
  store loc#9 i32 %r21, ptr %r20
  br label %B12

B11:
  %r45 = load i#6 i32, ptr %r7
  %r46 = add i32 0, 1 ; loadint
  %r47 = add i32 %r45, %r46
  store i#6 i32 %r47, ptr %r7
  br label %B6

B12:
  %r22 = alloca i32, i32 4
  %r23 = alloca i32, i32 4
  %r24 = load c#4 i32, ptr %r3
  %r25 = add i32 0, 1 ; loadint
  %r27 = add i32 0, 0 ; loadint
  %r26 = sub i32 %r27, %r25
  %r28 = icmp ne i32 %r24, %r26
  br i1 %r28, label %B13, label %B14

B13:
  %r29 = load c#4 i32, ptr %r3
  %r30 = add i32 0, 1 ; loadint
  %r32 = add i32 0, 0 ; loadint
  %r31 = sub i32 %r32, %r30
  %r33 = icmp ne i32 %r29, %r31
  store logic_expr@#23 i32 %r33, ptr %r23
  br label %B15

B14:
  %r34 = add i32 0, 0 ; loadint
  store logic_expr@#23 i32 %r34, ptr %r23
  br label %B15

B15:
  %r35 = load logic_expr@#23 i32, ptr %r23
  br i1 %r35, label %B16, label %B17

B16:
  %r36 = add i32 0, 0 ; loadint
  %r37 = load k#6 i32, ptr %r10
  %r38 = icmp eq i32 %r36, %r37
  store logic_expr@#22 i32 %r38, ptr %r22
  br label %B18

B17:
  %r39 = add i32 0, 0 ; loadint
  store logic_expr@#22 i32 %r39, ptr %r22
  br label %B18

B18:
  %r40 = load logic_expr@#22 i32, ptr %r22
  br i1 %r40, label %B19, label %B20

B19:
  %r41 = alloca i32, i32 4
  %r42 = add i32 0, 1 ; loadint
  store flag#10 i32 %r42, ptr %r41
  %r43 = alloca i32, i32 4
  %r44 = add i32 0, 1 ; loadint
  store tmp#10 i32 %r44, ptr %r43
  br label %B20

B20:
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
