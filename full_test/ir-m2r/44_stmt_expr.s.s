; module
@k#0 = global int, 4
@n#0 = global const int 10, 4
define i32 @main(){
B0:
  %r2 = add i32 0, 0 ; loadint
  %r3 = add i32 0, 1 ; loadint
  %r4 = loadaddr @k#0
  store i32 %r3, ptr %r4
  br label %B1

B1:
  %r29 = phi i32 [ %r2, %B0 ], [ %r13, %B2 ]
  %r6 = loadaddr @n#0
  %r7 = load i32, ptr %r6
  %r8 = add i32 0, 1 ; loadint
  %r9 = sub i32 %r7, %r8
  %r10 = icmp sle i32 %r29, %r9
  br i1 %r10, label %B2, label %B3

B2:
  %r12 = add i32 0, 1 ; loadint
  %r13 = add i32 %r29, %r12
  %r14 = loadaddr @k#0
  %r15 = load i32, ptr %r14
  %r16 = add i32 0, 1 ; loadint
  %r17 = add i32 %r15, %r16
  %r18 = loadaddr @k#0
  %r19 = load i32, ptr %r18
  %r20 = loadaddr @k#0
  %r21 = load i32, ptr %r20
  %r22 = add i32 %r19, %r21
  %r23 = loadaddr @k#0
  store i32 %r22, ptr %r23
  br label %B1

B3:
  %r25 = loadaddr @k#0
  %r26 = load i32, ptr %r25
  %r24 = call i32 @putint(i32 %r26)
  %r27 = loadaddr @k#0
  %r28 = load i32, ptr %r27
  ret i32 %r28

}
