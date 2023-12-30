; module
@a#0 = global int, 4
define i32 @main(){
B2:
  %r1 = alloca int, 4
  %r2 = add i32 0, 10 ; loadint
  %r3 = loadaddr @a#0
  store i32 %r2, ptr %r3
  %r5 = loadaddr @a#0
  %r6 = load i32, ptr %r5
  %r4 = call i32 @func(i32 %r6)
  store i32 %r4, ptr %r1
  %r7 = load i32, ptr %r1
  ret i32 %r7

}
define i32 @func(i32){
B0:
  %r2 = alloca int, 4
  store i32 %r1, ptr %r2
  %r3 = load i32, ptr %r2
  %r4 = add i32 0, 1 ; loadint
  %r5 = sub i32 %r3, %r4
  store i32 %r5, ptr %r2
  %r6 = load i32, ptr %r2
  ret i32 %r6

}
