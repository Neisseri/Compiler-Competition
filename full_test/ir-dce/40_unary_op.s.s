; module
define i32 @main(){
B0:
  %r1 = alloca int, 4
  %r2 = add i32 0, 10 ; loadint
  store i32 %r2, ptr %r1
  br label %B1

B1:
  %r3 = load i32, ptr %r1
  %r5 = add i32 0, 0 ; loadint
  %r4 = icmp eq i32 %r5, %r3
  %r7 = add i32 0, 0 ; loadint
  %r6 = icmp eq i32 %r7, %r4
  %r9 = add i32 0, 0 ; loadint
  %r8 = icmp eq i32 %r9, %r6
  %r11 = add i32 0, 0 ; loadint
  %r10 = sub i32 %r11, %r8
  br i1 %r10, label %B2, label %B3

B2:
  %r12 = add i32 0, 1 ; loadint
  %r14 = add i32 0, 0 ; loadint
  %r13 = sub i32 %r14, %r12
  %r16 = add i32 0, 0 ; loadint
  %r15 = sub i32 %r16, %r13
  %r18 = add i32 0, 0 ; loadint
  %r17 = sub i32 %r18, %r15
  store i32 %r17, ptr %r1
  br label %B4

B3:
  %r19 = add i32 0, 0 ; loadint
  store i32 %r19, ptr %r1
  br label %B4

B4:
  %r20 = load i32, ptr %r1
  ret i32 %r20

}
