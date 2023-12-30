; module
@a#0 = global const int 10, 4
define i32 @main(){
B0:
  %r1 = loadaddr @a#0
  %r2 = load i32, ptr %r1
  %r3 = add i32 0, 5 ; loadint
  %r4 = add i32 %r2, %r3
  ret i32 %r4

}
