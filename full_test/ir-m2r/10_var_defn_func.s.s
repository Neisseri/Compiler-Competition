; module
define i32 @main(){
B2:
  %r2 = call i32 @defn()
  ret i32 %r2

}
define i32 @defn(){
B0:
  %r1 = add i32 0, 4 ; loadint
  ret i32 %r1

}
