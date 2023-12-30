; module
@N#0 = global const int -1, 4
@arr#0 = global int [6] [i32 1, i32 2, i32 33, i32 4, i32 5, i32 6], 24
define i32 @main(){
B0:
  %r2 = add i32 0, 0 ; loadint
  %r4 = add i32 0, 0 ; loadint
  br label %B1

B1:
  %r21 = phi i32 [ %r4, %B0 ], [ %r15, %B2 ]
  %r20 = phi i32 [ %r2, %B0 ], [ %r18, %B2 ]
  %r6 = add i32 0, 6 ; loadint
  %r7 = icmp slt i32 %r20, %r6
  br i1 %r7, label %B2, label %B3

B2:
  %r9 = loadaddr @arr#0
  %r10 = add i32 0, 4 ; loadint
  %r12 = mul i32 %r20, %r10
  %r13 = add i32 %r9, %r12
  %r14 = load i32, ptr %r13
  %r15 = add i32 %r21, %r14
  %r17 = add i32 0, 1 ; loadint
  %r18 = add i32 %r20, %r17
  br label %B1

B3:
  ret i32 %r21

}
