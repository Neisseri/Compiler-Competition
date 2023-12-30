; module
define i32 @main(){
B0:
  %r1 = alloca int, 4
  %r2 = alloca int, 4
  %r3 = alloca int, 4
  %r4 = alloca int, 4
  %r5 = alloca int, 4
  %r6 = add i32 0, 5 ; loadint
  store i32 %r6, ptr %r1
  %r7 = add i32 0, 5 ; loadint
  store i32 %r7, ptr %r2
  %r8 = add i32 0, 1 ; loadint
  store i32 %r8, ptr %r3
  %r9 = add i32 0, 2 ; loadint
  %r11 = add i32 0, 0 ; loadint
  %r10 = sub i32 %r11, %r9
  store i32 %r10, ptr %r4
  %r12 = load i32, ptr %r4
  %r13 = add i32 0, 1 ; loadint
  %r14 = mul i32 %r12, %r13
  %r15 = add i32 0, 2 ; loadint
  %r16 = sdiv i32 %r14, %r15
  %r17 = load i32, ptr %r1
  %r18 = load i32, ptr %r2
  %r19 = sub i32 %r17, %r18
  %r20 = add i32 %r16, %r19
  %r21 = load i32, ptr %r3
  %r22 = add i32 0, 3 ; loadint
  %r23 = add i32 %r21, %r22
  %r25 = add i32 0, 0 ; loadint
  %r24 = sub i32 %r25, %r23
  %r26 = add i32 0, 2 ; loadint
  %r27 = srem i32 %r24, %r26
  %r28 = sub i32 %r20, %r27
  store i32 %r28, ptr %r5
  %r30 = load i32, ptr %r5
  %r29 = call i32 @putint(i32 %r30)
  %r31 = load i32, ptr %r4
  %r32 = add i32 0, 2 ; loadint
  %r33 = srem i32 %r31, %r32
  %r34 = add i32 0, 67 ; loadint
  %r35 = add i32 %r33, %r34
  %r36 = load i32, ptr %r1
  %r37 = load i32, ptr %r2
  %r38 = sub i32 %r36, %r37
  %r40 = add i32 0, 0 ; loadint
  %r39 = sub i32 %r40, %r38
  %r41 = add i32 %r35, %r39
  %r42 = load i32, ptr %r3
  %r43 = add i32 0, 2 ; loadint
  %r44 = add i32 %r42, %r43
  %r45 = add i32 0, 2 ; loadint
  %r46 = srem i32 %r44, %r45
  %r48 = add i32 0, 0 ; loadint
  %r47 = sub i32 %r48, %r46
  %r49 = sub i32 %r41, %r47
  store i32 %r49, ptr %r5
  %r50 = load i32, ptr %r5
  %r51 = add i32 0, 3 ; loadint
  %r52 = add i32 %r50, %r51
  store i32 %r52, ptr %r5
  %r54 = load i32, ptr %r5
  %r53 = call i32 @putint(i32 %r54)
  %r55 = add i32 0, 0 ; loadint
  ret i32 %r55

}
