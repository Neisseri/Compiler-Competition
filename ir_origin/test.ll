; module
define i32 @main(){
B4:
  %r1 = alloca i32, i32 4
  %r2 = add i32 0, 1 ; loadint
  store i32 %r2, ptr %r1
  %r3 = alloca i32, i32 4
  %r4 = add i32 0, 2 ; loadint
  store i32 %r4, ptr %r3
  %r5 = alloca i32, i32 4
  %r6 = add i32 0, 2 ; loadint
  store i32 %r6, ptr %r5
  %r7 = alloca i32, i32 4
  %r8 = add i32 0, 4 ; loadint
  store i32 %r8, ptr %r7
  %r9 = alloca i32, i32 4
  %r10 = add i32 0, 5 ; loadint
  store i32 %r10, ptr %r9
  %r11 = alloca i32, i32 4
  %r12 = add i32 0, 6 ; loadint
  store i32 %r12, ptr %r11
  %r13 = alloca i32, i32 4
  %r14 = add i32 0, 8 ; loadint
  store i32 %r14, ptr %r13
  %r16 = load i32, ptr %r1
  %r17 = load i32, ptr %r3
  %r18 = load i32, ptr %r3
  %r19 = load i32, ptr %r5
  %r20 = load i32, ptr %r7
  %r21 = load i32, ptr %r9
  %r22 = load i32, ptr %r13
  %r23 = load i32, ptr %r11
  %r24 = load i32, ptr %r13
  %r25 = load i32, ptr %r11
  %r26 = load i32, ptr %r5
  %r27 = load i32, ptr %r7
  %r28 = load i32, ptr %r5
  %r29 = load i32, ptr %r9
  %r15 = call i32 @goo(i32 %r16, i32 %r17, i32 %r18, i32 %r19, i32 %r20, i32 %r21, i32 %r22, i32 %r23, i32 %r24, i32 %r25, i32 %r26, i32 %r27, i32 %r28, i32 %r29)
  store i32 %r15, ptr %r7
  %r30 = load i32, ptr %r7
  ret i32 %r30

}
define i32 @goo(i32 %r1, i32 %r2, i32 %r3, i32 %r4, i32 %r5, i32 %r6, i32 %r7, i32 %r8, i32 %r9, i32 %r10, i32 %r11, i32 %r12, i32 %r13, i32 %r14){
B2:
  %r15 = alloca i32, i32 4
  store i32 %r1, ptr %r15
  %r16 = alloca i32, i32 4
  store i32 %r2, ptr %r16
  %r17 = alloca i32, i32 4
  store i32 %r3, ptr %r17
  %r18 = alloca i32, i32 4
  store i32 %r4, ptr %r18
  %r19 = alloca i32, i32 4
  store i32 %r5, ptr %r19
  %r20 = alloca i32, i32 4
  store i32 %r6, ptr %r20
  %r21 = alloca i32, i32 4
  store i32 %r7, ptr %r21
  %r22 = alloca i32, i32 4
  store i32 %r8, ptr %r22
  %r23 = alloca i32, i32 4
  store i32 %r9, ptr %r23
  %r24 = alloca i32, i32 4
  store i32 %r10, ptr %r24
  %r25 = alloca i32, i32 4
  store i32 %r11, ptr %r25
  %r26 = alloca i32, i32 4
  store i32 %r12, ptr %r26
  %r27 = alloca i32, i32 4
  store i32 %r13, ptr %r27
  %r28 = alloca i32, i32 4
  store i32 %r14, ptr %r28
  %r30 = load i32, ptr %r21
  %r31 = load i32, ptr %r20
  %r29 = call i32 @foo(i32 %r30, i32 %r31)
  ret i32 %r29

}
define i32 @foo(i32 %r1, i32 %r2){
B0:
  %r3 = alloca i32, i32 4
  store i32 %r1, ptr %r3
  %r4 = alloca i32, i32 4
  store i32 %r2, ptr %r4
  %r5 = load i32, ptr %r3
  %r6 = load i32, ptr %r4
  %r7 = add i32 %r5, %r6
  ret i32 %r7

}
