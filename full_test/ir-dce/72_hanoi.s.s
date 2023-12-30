; module
define i32 @main(){
B8:
  %r1 = alloca int, 4
  %r2 = call i32 @getint()
  store i32 %r2, ptr %r1
  br label %B9

B9:
  %r3 = load i32, ptr %r1
  %r4 = add i32 0, 0 ; loadint
  %r5 = icmp sgt i32 %r3, %r4
  br i1 %r5, label %B10, label %B11

B10:
  %r7 = call i32 @getint()
  %r8 = add i32 0, 1 ; loadint
  %r9 = add i32 0, 2 ; loadint
  %r10 = add i32 0, 3 ; loadint
  %r6 = call@hanoi(i32 %r7, i32 %r8, i32 %r9, i32 %r10)
  %r12 = add i32 0, 10 ; loadint
  %r11 = call i32 @putch(i32 %r12)
  %r13 = load i32, ptr %r1
  %r14 = add i32 0, 1 ; loadint
  %r15 = sub i32 %r13, %r14
  store i32 %r15, ptr %r1
  br label %B9

B11:
  %r16 = add i32 0, 0 ; loadint
  ret i32 %r16

}
define void @hanoi(i32, i32, i32, i32){
B2:
  %r5 = alloca int, 4
  store i32 %r1, ptr %r5
  %r6 = alloca int, 4
  store i32 %r2, ptr %r6
  %r7 = alloca int, 4
  store i32 %r3, ptr %r7
  %r8 = alloca int, 4
  store i32 %r4, ptr %r8
  br label %B3

B3:
  %r9 = load i32, ptr %r5
  %r10 = add i32 0, 1 ; loadint
  %r11 = icmp eq i32 %r9, %r10
  br i1 %r11, label %B4, label %B5

B4:
  %r13 = load i32, ptr %r6
  %r14 = load i32, ptr %r8
  %r12 = call@move(i32 %r13, i32 %r14)
  br label %B6

B5:
  %r16 = load i32, ptr %r5
  %r17 = add i32 0, 1 ; loadint
  %r18 = sub i32 %r16, %r17
  %r19 = load i32, ptr %r6
  %r20 = load i32, ptr %r8
  %r21 = load i32, ptr %r7
  %r15 = call i32 @hanoi(i32 %r18, i32 %r19, i32 %r20, i32 %r21)
  %r23 = load i32, ptr %r6
  %r24 = load i32, ptr %r8
  %r22 = call@move(i32 %r23, i32 %r24)
  %r26 = load i32, ptr %r5
  %r27 = add i32 0, 1 ; loadint
  %r28 = sub i32 %r26, %r27
  %r29 = load i32, ptr %r7
  %r30 = load i32, ptr %r6
  %r31 = load i32, ptr %r8
  %r25 = call i32 @hanoi(i32 %r28, i32 %r29, i32 %r30, i32 %r31)
  br label %B6

B6:
  %r32 = add i32 0, 0 ; loadint
  ret i32 %r32

}
define void @move(i32, i32){
B0:
  %r3 = alloca int, 4
  store i32 %r1, ptr %r3
  %r4 = alloca int, 4
  store i32 %r2, ptr %r4
  %r6 = load i32, ptr %r3
  %r5 = call i32 @putint(i32 %r6)
  %r8 = add i32 0, 32 ; loadint
  %r7 = call i32 @putch(i32 %r8)
  %r10 = load i32, ptr %r4
  %r9 = call i32 @putint(i32 %r10)
  %r12 = add i32 0, 44 ; loadint
  %r11 = call i32 @putch(i32 %r12)
  %r14 = add i32 0, 32 ; loadint
  %r13 = call i32 @putch(i32 %r14)
  %r15 = add i32 0, 0 ; loadint
  ret i32 %r15

}
