; module
define i32 @main(){
B8:
  %r2 = call i32 @getint()
  br label %B9

B9:
  %r17 = phi i32 [ %r2, %B8 ], [ %r15, %B10 ]
  %r4 = add i32 0, 0 ; loadint
  %tmpcmp5 = icmp sgt i32 %r17, %r4
  %r5 = zext i1 %tmpcmp5 to i32
  %tmpconbr5 = trunc i32 %r5 to i1
  br i1 %tmpconbr5, label %B10, label %B11

B10:
  %r7 = call i32 @getint()
  %r8 = add i32 0, 1 ; loadint
  %r9 = add i32 0, 2 ; loadint
  %r10 = add i32 0, 3 ; loadint
  %r6 = call i32 @hanoi(i32 %r7, i32 %r8, i32 %r9, i32 %r10)
  %r12 = add i32 0, 10 ; loadint
  %r11 = call i32 @putch(i32 %r12)
  %r14 = add i32 0, 1 ; loadint
  %r15 = sub i32 %r17, %r14
  br label %B9

B11:
  %r16 = add i32 0, 0 ; loadint
  ret i32 %r16

}
define i32 @hanoi(i32 %r1, i32 %r2, i32 %r3, i32 %r4){
B2:
  br label %B3

B3:
  %r10 = add i32 0, 1 ; loadint
  %tmpcmp11 = icmp eq i32 %r1, %r10
  %r11 = zext i1 %tmpcmp11 to i32
  %tmpconbr11 = trunc i32 %r11 to i1
  br i1 %tmpconbr11, label %B4, label %B5

B4:
  %r12 = call i32 @move(i32 %r2, i32 %r4)
  br label %B6

B5:
  %r17 = add i32 0, 1 ; loadint
  %r18 = sub i32 %r1, %r17
  %r15 = call i32 @hanoi(i32 %r18, i32 %r2, i32 %r4, i32 %r3)
  %r22 = call i32 @move(i32 %r2, i32 %r4)
  %r27 = add i32 0, 1 ; loadint
  %r28 = sub i32 %r1, %r27
  %r25 = call i32 @hanoi(i32 %r28, i32 %r3, i32 %r2, i32 %r4)
  br label %B6

B6:
  %r32 = add i32 0, 0 ; loadint
  ret i32 %r32

}
define i32 @move(i32 %r1, i32 %r2){
B0:
  %r5 = call i32 @putint(i32 %r1)
  %r8 = add i32 0, 32 ; loadint
  %r7 = call i32 @putch(i32 %r8)
  %r9 = call i32 @putint(i32 %r2)
  %r12 = add i32 0, 44 ; loadint
  %r11 = call i32 @putch(i32 %r12)
  %r14 = add i32 0, 32 ; loadint
  %r13 = call i32 @putch(i32 %r14)
  %r15 = add i32 0, 0 ; loadint
  ret i32 %r15

}
