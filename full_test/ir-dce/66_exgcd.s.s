; module
define i32 @main(){
B7:
  %r1 = alloca int, 4
  %r2 = add i32 0, 7 ; loadint
  store i32 %r2, ptr %r1
  %r3 = alloca int, 4
  %r4 = add i32 0, 15 ; loadint
  store i32 %r4, ptr %r3
  %r5 = alloca int [1], 4
  %r6 = add i32 0, 1 ; loadint
  %r8 = add i32 0, 0 ; loadint
  %r7 = add i32 %r5, %r8
  store i32 %r6, ptr %r7
  %r9 = alloca int [1], 4
  %r10 = add i32 0, 1 ; loadint
  %r12 = add i32 0, 0 ; loadint
  %r11 = add i32 %r9, %r12
  store i32 %r10, ptr %r11
  %r14 = load i32, ptr %r1
  %r15 = load i32, ptr %r3
  %r13 = call i32 @exgcd(i32 %r14, i32 %r15, i32 %r5, i32 %r9)
  %r16 = add i32 0, 4 ; loadint
  %r17 = add i32 0, 0 ; loadint
  %r18 = mul i32 %r17, %r16
  %r19 = add i32 %r5, %r18
  %r20 = load i32, ptr %r19
  %r21 = load i32, ptr %r3
  %r22 = srem i32 %r20, %r21
  %r23 = load i32, ptr %r3
  %r24 = add i32 %r22, %r23
  %r25 = load i32, ptr %r3
  %r26 = srem i32 %r24, %r25
  %r27 = add i32 0, 4 ; loadint
  %r28 = add i32 0, 0 ; loadint
  %r29 = mul i32 %r28, %r27
  %r30 = add i32 %r5, %r29
  store i32 %r26, ptr %r30
  %r32 = add i32 0, 4 ; loadint
  %r33 = add i32 0, 0 ; loadint
  %r34 = mul i32 %r33, %r32
  %r35 = add i32 %r5, %r34
  %r36 = load i32, ptr %r35
  %r31 = call i32 @putint(i32 %r36)
  %r37 = add i32 0, 0 ; loadint
  ret i32 %r37

}
define i32 @exgcd(i32, i32, i32, i32){
B0:
  %r5 = alloca int, 4
  store i32 %r1, ptr %r5
  %r6 = alloca int, 4
  store i32 %r2, ptr %r6
  br label %B1

B1:
  %r7 = load i32, ptr %r6
  %r8 = add i32 0, 0 ; loadint
  %r9 = icmp eq i32 %r7, %r8
  br i1 %r9, label %B2, label %B3

B2:
  %r10 = add i32 0, 1 ; loadint
  %r11 = add i32 0, 4 ; loadint
  %r12 = add i32 0, 0 ; loadint
  %r13 = mul i32 %r12, %r11
  %r14 = add i32 %r3, %r13
  store i32 %r10, ptr %r14
  %r15 = add i32 0, 0 ; loadint
  %r16 = add i32 0, 4 ; loadint
  %r17 = add i32 0, 0 ; loadint
  %r18 = mul i32 %r17, %r16
  %r19 = add i32 %r4, %r18
  store i32 %r15, ptr %r19
  %r20 = load i32, ptr %r5
  ret i32 %r20

B3:
  %r21 = alloca int, 4
  %r23 = load i32, ptr %r6
  %r24 = load i32, ptr %r5
  %r25 = load i32, ptr %r6
  %r26 = srem i32 %r24, %r25
  %r22 = call i32 @exgcd(i32 %r23, i32 %r26, i32 %r3, i32 %r4)
  store i32 %r22, ptr %r21
  %r27 = alloca int, 4
  %r28 = add i32 0, 4 ; loadint
  %r29 = add i32 0, 0 ; loadint
  %r30 = mul i32 %r29, %r28
  %r31 = add i32 %r3, %r30
  %r32 = load i32, ptr %r31
  store i32 %r32, ptr %r27
  %r33 = add i32 0, 4 ; loadint
  %r34 = add i32 0, 0 ; loadint
  %r35 = mul i32 %r34, %r33
  %r36 = add i32 %r4, %r35
  %r37 = load i32, ptr %r36
  %r38 = add i32 0, 4 ; loadint
  %r39 = add i32 0, 0 ; loadint
  %r40 = mul i32 %r39, %r38
  %r41 = add i32 %r3, %r40
  store i32 %r37, ptr %r41
  %r42 = load i32, ptr %r27
  %r43 = load i32, ptr %r5
  %r44 = load i32, ptr %r6
  %r45 = sdiv i32 %r43, %r44
  %r46 = add i32 0, 4 ; loadint
  %r47 = add i32 0, 0 ; loadint
  %r48 = mul i32 %r47, %r46
  %r49 = add i32 %r4, %r48
  %r50 = load i32, ptr %r49
  %r51 = mul i32 %r45, %r50
  %r52 = sub i32 %r42, %r51
  %r53 = add i32 0, 4 ; loadint
  %r54 = add i32 0, 0 ; loadint
  %r55 = mul i32 %r54, %r53
  %r56 = add i32 %r4, %r55
  store i32 %r52, ptr %r56
  %r57 = load i32, ptr %r21
  ret i32 %r57

}
