; module
define i32 @main(){
B0:
  %r6 = add i32 0, 5 ; loadint
  %r7 = add i32 0, 5 ; loadint
  %r8 = add i32 0, 1 ; loadint
  %r9 = add i32 0, 2 ; loadint
  %r11 = add i32 0, 0 ; loadint
  %r10 = sub i32 %r11, %r9
  %r13 = add i32 0, 1 ; loadint
  %r14 = mul i32 %r10, %r13
  %r15 = add i32 0, 2 ; loadint
  %r16 = sdiv i32 %r14, %r15
  %r19 = sub i32 %r6, %r7
  %r20 = add i32 %r16, %r19
  %r22 = add i32 0, 3 ; loadint
  %r23 = add i32 %r8, %r22
  %r25 = add i32 0, 0 ; loadint
  %r24 = sub i32 %r25, %r23
  %r26 = add i32 0, 2 ; loadint
  %r27 = srem i32 %r24, %r26
  %r28 = sub i32 %r20, %r27
  %r29 = call i32 @putint(i32 %r28)
  %r32 = add i32 0, 2 ; loadint
  %r33 = srem i32 %r10, %r32
  %r34 = add i32 0, 67 ; loadint
  %r35 = add i32 %r33, %r34
  %r38 = sub i32 %r6, %r7
  %r40 = add i32 0, 0 ; loadint
  %r39 = sub i32 %r40, %r38
  %r41 = add i32 %r35, %r39
  %r43 = add i32 0, 2 ; loadint
  %r44 = add i32 %r8, %r43
  %r45 = add i32 0, 2 ; loadint
  %r46 = srem i32 %r44, %r45
  %r48 = add i32 0, 0 ; loadint
  %r47 = sub i32 %r48, %r46
  %r49 = sub i32 %r41, %r47
  %r51 = add i32 0, 3 ; loadint
  %r52 = add i32 %r49, %r51
  %r53 = call i32 @putint(i32 %r52)
  %r55 = add i32 0, 0 ; loadint
  ret i32 %r55

}
