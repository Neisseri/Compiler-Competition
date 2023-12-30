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
  %r12 = alloca int, 4
  %r13 = add i32 0, 112 ; loadint
  store i32 %r13, ptr %r12
  br label %B4

B3:
  %r40 = loadaddr @k#0
  %r41 = load i32, ptr %r40
  ret i32 %r41

B4:
  %r14 = load i32, ptr %r12
  %r15 = add i32 0, 10 ; loadint
  %r16 = icmp sgt i32 %r14, %r15
  br i1 %r16, label %B5, label %B6

B5:
  %r17 = load i32, ptr %r12
  %r18 = add i32 0, 88 ; loadint
  %r19 = sub i32 %r17, %r18
  store i32 %r19, ptr %r12
  br label %B7

B6:
  %r39 = load i32, ptr %r12
  %r38 = call i32 @putint(i32 %r39)
  br label %B3

B7:
  %r20 = load i32, ptr %r12
  %r21 = add i32 0, 1000 ; loadint
  %r22 = icmp slt i32 %r20, %r21
  br i1 %r22, label %B8, label %B9

B8:
  %r23 = alloca int, 4
  %r24 = add i32 0, 9 ; loadint
  store i32 %r24, ptr %r23
  %r25 = alloca int, 4
  %r26 = add i32 0, 11 ; loadint
  store i32 %r26, ptr %r25
  %r27 = add i32 0, 10 ; loadint
  store i32 %r27, ptr %r23
  %r28 = load i32, ptr %r12
  %r29 = load i32, ptr %r23
  %r30 = sub i32 %r28, %r29
  store i32 %r30, ptr %r12
  %r31 = alloca int, 4
  %r32 = add i32 0, 11 ; loadint
  store i32 %r32, ptr %r31
  %r33 = load i32, ptr %r12
  %r34 = load i32, ptr %r31
  %r35 = add i32 %r33, %r34
  %r36 = load i32, ptr %r25
  %r37 = add i32 %r35, %r36
  store i32 %r37, ptr %r12
  br label %B9

B9:
  br label %B4

}
