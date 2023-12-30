; module
@a#0 = global const int 10, 4
@b#0 = global const int 5, 4
define i32 @main(){
B0:
  %r1 = loadaddr @b#0
  %r2 = load i32, ptr %r1
  ret i32 %r2

}
