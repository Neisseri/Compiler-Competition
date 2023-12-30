; module
@loopCount#0 = global int 0, 4
@global#0 = global int 0, 4
define i32 @main(){
B2:
  %2 = 100
  %1 = call@func(i32 %2)
  %3 = 0
  ret i32 %3

}
define void @func(i32){
B0:
  %22 = loadaddr @global#0
  store i32 %1, ptr %22
  %45 = 0
  ret i32 %45

}
