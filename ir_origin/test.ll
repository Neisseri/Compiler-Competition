; module
@N = global i32 1024, i32 4
@A = global i32, i32 4194304
@B = global i32, i32 4194304
@C = global i32, i32 4194304
define i32 @main(){
B2:
  %r1 = add i32 0, 0 ; loadint
  ret i32 %r1

}
define void @mm(i32 %r1){
B0:
  %r2 = alloca i32, i32 4
  %r3 = add i32 0, 4 ; loadint
  %r4 = add i32 0, 2 ; loadint
  %r5 = mul i32 %r4, %r3
  %r6 = add i32 %r1, %r5
  %r7 = add i32 0, 1 ; loadint
  %r8 = mul i32 %r3, %r7
  %r9 = add i32 0, 1 ; loadint
  %r10 = mul i32 %r9, %r8
  %r11 = add i32 %r6, %r10
  %r12 = load A#1 i32, ptr %r11
  store k#2 i32 %r12, ptr %r2
  %r13 = add i32 0, 0 ; loadint
  ret i32 %r13

}
