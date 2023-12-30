; module
@a#0 = global const int 10, 4
define i32 @main(){
B0:
  %r2 = add i32 0, 2 ; loadint
  %r4 = loadaddr @a#0
  %r5 = load i32, ptr %r4
  %r6 = sub i32 %r2, %r5
  ret i32 %r6

}
