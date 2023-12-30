; module
define i32 @main(){
B2:
  %r1 = alloca int, 4
  %r2 = call i32 @defn()
  store i32 %r2, ptr %r1
  %r3 = load i32, ptr %r1
  ret i32 %r3

}
define i32 @defn(){
B0:
  %r1 = add i32 0, 4 ; loadint
  ret i32 %r1

}
