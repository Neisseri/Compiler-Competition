; module
@a#0 = global int 7, 4
define i32 @main(){
B7:
  %r1 = alloca int, 4
  %r2 = add i32 0, 0 ; loadint
  store i32 %r2, ptr %r1
  %r3 = alloca int, 4
  %r4 = add i32 0, 0 ; loadint
  store i32 %r4, ptr %r3
  br label %B8

B8:
  %r5 = load i32, ptr %r3
  %r6 = add i32 0, 100 ; loadint
  %r7 = icmp slt i32 %r5, %r6
  br i1 %r7, label %B9, label %B10

B9:
  br label %B11

B10:
  br label %B14

B11:
  %r8 = call i32 @func()
  %r9 = add i32 0, 1 ; loadint
  %r10 = icmp eq i32 %r8, %r9
  br i1 %r10, label %B12, label %B13

B12:
  %r11 = load i32, ptr %r1
  %r12 = add i32 0, 1 ; loadint
  %r13 = add i32 %r11, %r12
  store i32 %r13, ptr %r1
  br label %B13

B13:
  %r14 = load i32, ptr %r3
  %r15 = add i32 0, 1 ; loadint
  %r16 = add i32 %r14, %r15
  store i32 %r16, ptr %r3
  br label %B8

B14:
  %r17 = load i32, ptr %r1
  %r18 = add i32 0, 100 ; loadint
  %r19 = icmp slt i32 %r17, %r18
  br i1 %r19, label %B15, label %B16

B15:
  %r21 = add i32 0, 1 ; loadint
  %r20 = call i32 @putint(i32 %r21)
  br label %B17

B16:
  %r23 = add i32 0, 0 ; loadint
  %r22 = call i32 @putint(i32 %r23)
  br label %B17

B17:
  %r24 = add i32 0, 0 ; loadint
  ret i32 %r24

}
define i32 @func(){
B0:
  %r1 = alloca int, 4
  %r2 = loadaddr @a#0
  %r3 = load i32, ptr %r2
  store i32 %r3, ptr %r1
  %r4 = alloca int, 4
  %r5 = add i32 0, 1 ; loadint
  store i32 %r5, ptr %r4
  br label %B1

B1:
  %r6 = load i32, ptr %r4
  %r7 = load i32, ptr %r1
  %r8 = icmp eq i32 %r6, %r7
  br i1 %r8, label %B2, label %B3

B2:
  %r9 = load i32, ptr %r4
  %r10 = add i32 0, 1 ; loadint
  %r11 = add i32 %r9, %r10
  store i32 %r11, ptr %r4
  %r12 = add i32 0, 1 ; loadint
  ret i32 %r12

B3:
  %r13 = add i32 0, 0 ; loadint
  ret i32 %r13

}
