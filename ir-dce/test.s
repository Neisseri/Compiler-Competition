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
  %2 = alloca int, 4
  store i32 %1, ptr %2
  %3 = alloca int, 4
  %4 = 1
  store i32 %4, ptr %3
  %5 = alloca int, 4
  %6 = 2
  store i32 %6, ptr %5
  %7 = alloca int, 4
  %8 = 3
  store i32 %8, ptr %7
  %9 = alloca int, 4
  %10 = 4
  store i32 %10, ptr %9
  %11 = alloca int, 4
  %12 = 5
  store i32 %12, ptr %11
  %13 = alloca int, 4
  %14 = 6
  store i32 %14, ptr %13
  %15 = alloca int, 4
  %16 = 7
  store i32 %16, ptr %15
  %17 = alloca int, 4
  %18 = 8
  store i32 %18, ptr %17
  %19 = alloca int, 4
  %20 = 9
  store i32 %20, ptr %19
  %21 = load i32, ptr %2
  %22 = loadaddr @global#0
  store i32 %21, ptr %22
  %23 = alloca int, 4
  %24 = 10
  store i32 %24, ptr %23
  %25 = alloca int, 4
  %26 = 11
  store i32 %26, ptr %25
  %27 = alloca int, 4
  %28 = 12
  store i32 %28, ptr %27
  %29 = alloca int, 4
  %30 = 13
  store i32 %30, ptr %29
  %31 = alloca int, 4
  %32 = 14
  store i32 %32, ptr %31
  %33 = alloca int, 4
  %34 = 15
  store i32 %34, ptr %33
  %35 = alloca int, 4
  %36 = 16
  store i32 %36, ptr %35
  %37 = alloca int, 4
  %38 = 17
  store i32 %38, ptr %37
  %39 = alloca int, 4
  %40 = 18
  store i32 %40, ptr %39
  %41 = alloca int, 4
  %42 = 19
  store i32 %42, ptr %41
  %43 = alloca int, 4
  %44 = 20
  store i32 %44, ptr %43
  %45 = 0
  ret i32 %45

}
