; module
@a#0 = global int, 4
define i32 @main(){
B2:
  %r2 = add i32 0, 10 ; loadint
  %r3 = loadaddr @a#0
  store i32 %r2, ptr %r3
  %r5 = loadaddr @a#0
  %r6 = load i32, ptr %r5
  %r4 = call i32 @func(i32 %r6)
  ret i32 %r4

}
define i32 @func(i32){
B0:
  %r4 = add i32 0, 1 ; loadint
  %r5 = sub i32 %r1, %r4
  ret i32 %r5

}
