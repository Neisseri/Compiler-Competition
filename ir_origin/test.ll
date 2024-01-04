; module
define i32 @main(){
B0:
  %r1 = alloca i32, i32 4
  %r2 = add i32 0, 4 ; loadint
  store i32 %r2, ptr %r1
  br label %B1

B1:
  %r3 = load i32, ptr %r1
  %r4 = add i32 0, 75 ; loadint
  %r5 = icmp slt i32 %r3, %r4
  br i1 %r5, label %B2, label %B3

B2:
  %r6 = alloca i32, i32 4
  %r7 = add i32 0, 42 ; loadint
  store i32 %r7, ptr %r6
  br label %B4

B3:
  %r20 = load i32, ptr %r1
  ret i32 %r20

B4:
  %r8 = load i32, ptr %r1
  %r9 = add i32 0, 100 ; loadint
  %r10 = icmp slt i32 %r8, %r9
  br i1 %r10, label %B5, label %B6

B5:
  %r11 = load i32, ptr %r1
  %r12 = add i32 0, 42 ; loadint
  %r13 = add i32 %r11, %r12
  store i32 %r13, ptr %r1
  br label %B7

B6:
  br label %B1

B7:
  %r14 = load i32, ptr %r1
  %r15 = add i32 0, 99 ; loadint
  %r16 = icmp sgt i32 %r14, %r15
  br i1 %r16, label %B8, label %B9

B8:
  %r17 = alloca i32, i32 4
  %r18 = add i32 0, 84 ; loadint
  store i32 %r18, ptr %r17
  %r19 = add i32 0, 168 ; loadint
  store i32 %r19, ptr %r1
  br label %B9

B9:
  br label %B6

}
