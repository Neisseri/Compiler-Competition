; module
@N#0 = global const int -1, 4
@arr#0 = global int [-9794] [i32 1, i32 2, i32 33, i32 4, i32 5, i32 6], -39176
define i32 @main(){
B0:
  %r1 = alloca int, 4
  %r2 = add i32 0, 0 ; loadint
  store i32 %r2, ptr %r1
  %r3 = alloca int, 4
  %r4 = add i32 0, 0 ; loadint
  store i32 %r4, ptr %r3
  br label %B1

B1:
  %r5 = load i32, ptr %r1
  %r6 = add i32 0, 6 ; loadint
  %r7 = icmp slt i32 %r5, %r6
  br i1 %r7, label %B2, label %B3

B2:
  %r8 = load i32, ptr %r3
  %r9 = loadaddr @arr#0
  %r10 = add i32 0, 4 ; loadint
  %r11 = load i32, ptr %r1
  %r12 = mul i32 %r11, %r10
  %r13 = add i32 %r9, %r12
  %r14 = load i32, ptr %r13
  %r15 = add i32 %r8, %r14
  store i32 %r15, ptr %r3
  %r16 = load i32, ptr %r1
  %r17 = add i32 0, 1 ; loadint
  %r18 = add i32 %r16, %r17
  store i32 %r18, ptr %r1
  br label %B1

B3:
  %r19 = load i32, ptr %r3
  ret i32 %r19

}
