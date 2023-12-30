; module
@a#0 = global const int [5] [i32 0, i32 1, i32 2, i32 3, i32 4], 20
define i32 @main(){
B0:
  %r1 = loadaddr @a#0
  %r2 = add i32 0, 4 ; loadint
  %r3 = add i32 0, 4 ; loadint
  %r4 = mul i32 %r3, %r2
  %r5 = add i32 %r1, %r4
  %r6 = load i32, ptr %r5
  ret i32 %r6

}
