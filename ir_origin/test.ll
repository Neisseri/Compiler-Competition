; module
define i32 @main(){
B0:
  %r1 = alloca i32, i32 4
  %r2 = alloca i32, i32 4
  %r3 = alloca i32, i32 4
  %r4 = alloca i32, i32 4
  %r5 = alloca i32, i32 4
  %r6 = add i32 0, 5 ; loadint
  store a#2 i32 %r6, ptr %r1
  %r7 = add i32 0, 5 ; loadint
  store b#2 i32 %r7, ptr %r2
  %r8 = add i32 0, 1 ; loadint
  store c#2 i32 %r8, ptr %r3
  %r9 = add i32 0, 2 ; loadint
  %r11 = add i32 0, 0 ; loadint
  %r10 = sub i32 %r11, %r9
  store d#2 i32 %r10, ptr %r4
  %r12 = add i32 0, 2 ; loadint
  store result#2 i32 %r12, ptr %r5
  br label %B1

B1:
  %r13 = alloca i32, i32 4
  %r14 = load d#2 i32, ptr %r4
  %r15 = add i32 0, 1 ; loadint
  %r16 = mul i32 %r14, %r15
  %r17 = add i32 0, 2 ; loadint
  %r18 = sdiv i32 %r16, %r17
  %r19 = add i32 0, 0 ; loadint
  %r20 = icmp slt i32 %r18, %r19
  br i1 %r20, label %B2, label %B3

B2:
  %r36 = add i32 0, 1 ; loadint
  store logic_expr@#13 i32 %r36, ptr %r13
  br label %B4

B3:
  %r21 = alloca i32, i32 4
  %r22 = load a#2 i32, ptr %r1
  %r23 = load b#2 i32, ptr %r2
  %r24 = sub i32 %r22, %r23
  %r25 = add i32 0, 0 ; loadint
  %r26 = icmp ne i32 %r24, %r25
  br i1 %r26, label %B5, label %B6

B4:
  %r37 = load logic_expr@#13 i32, ptr %r13
  br i1 %r37, label %B8, label %B9

B5:
  %r27 = load c#2 i32, ptr %r3
  %r28 = add i32 0, 3 ; loadint
  %r29 = add i32 %r27, %r28
  %r30 = add i32 0, 2 ; loadint
  %r31 = srem i32 %r29, %r30
  %r32 = add i32 0, 0 ; loadint
  %r33 = icmp ne i32 %r31, %r32
  store logic_expr@#21 i32 %r33, ptr %r21
  br label %B7

B6:
  %r34 = add i32 0, 0 ; loadint
  store logic_expr@#21 i32 %r34, ptr %r21
  br label %B7

B7:
  %r35 = load logic_expr@#21 i32, ptr %r21
  store logic_expr@#13 i32 %r35, ptr %r13
  br label %B4

B8:
  %r39 = load result#2 i32, ptr %r5
  %r38 = call i32 @putint(i32 %r39)
  br label %B9

B9:
  %r40 = add i32 0, 0 ; loadint
  ret i32 %r40

}
