; module
@a#0 = global int 3, 4
@b#0 = global int 5, 4
define i32 @main(){
B0:
  %r2 = add i32 0, 5 ; loadint
  %r4 = loadaddr @b#0
  %r5 = load i32, ptr %r4
  %r6 = add i32 %r2, %r5
  ret i32 %r6

}
