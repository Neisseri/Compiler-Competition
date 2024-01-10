; module
define i32 @main(){
B6:
  %r2 = add i32 0, 2 ; loadint
  %r3 = add i32 0, 2 ; loadint
  %r4 = add i32 0, 3 ; loadint
  %r1 = call i32 @hanoi(i32 %r2, i32 %r3, i32 %r4)
  %r5 = add i32 0, 0 ; loadint
  ret i32 %r5

}
define i32 @hanoi(i32 %r1, i32 %r2, i32 %r3){
B0:
  %r4 = alloca i32, i32 4
  store i32 %r1, ptr %r4
  %r5 = alloca i32, i32 4
  store i32 %r2, ptr %r5
  %r6 = alloca i32, i32 4
  store i32 %r3, ptr %r6
  br label %B1

B1:
  %r7 = load i32, ptr %r4
  %r8 = add i32 0, 1 ; loadint
  %tmpcmp9 = icmp eq i32 %r7, %r8
  %r9 = zext i1 %tmpcmp9 to i32
  %tmpconbr9 = trunc i32 %r9 to i1
  br i1 %tmpconbr9, label %B2, label %B3

B2:
  %r11 = load i32, ptr %r6
  %r10 = call i32 @putint(i32 %r11)
  br label %B4

B3:
  %r13 = load i32, ptr %r4
  %r14 = add i32 0, 1 ; loadint
  %r15 = sub i32 %r13, %r14
  %r16 = load i32, ptr %r6
  %r17 = load i32, ptr %r5
  %r12 = call i32 @hanoi(i32 %r15, i32 %r16, i32 %r17)
  br label %B4

B4:
  %r18 = add i32 0, 0 ; loadint
  ret i32 %r18

}
