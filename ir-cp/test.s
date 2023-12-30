; module
define i32 @main(){
B24:
  %2 = call i32 @ifElseIf()
  %1 = call i32 @putint(i32 %2)
  %3 = 0
  ret i32 %3

}
define i32 @ifElseIf(){
B0:
  %2 = 5
  %4 = 10
  br label B1

B1:
  %7 = 6
  %8 = 0
  br label B3

B2:
  %12 = 1
  br label B4

B3:
  %10 = 11
  %11 = 0
  br label B4

B4:
  %4 = 1
  br label B5

B5:
  ret i32 %2

B6:
  br label B9

B7:
  ret i32 %9

B9:
  %17 = 10
  %18 = 0
  br label B11

B10:
  %20 = 1
  %21 = 0
  br label B12

B11:
  %22 = 0
  br label B12

B12:
  %5 = 0
  br label B14

B13:
  %24 = 25
  br label B15

B14:
  br label B16

B15:
  %8 = phi i32 [ %6, B22 ]
  %9 = 25
  br label B7

B16:
  %27 = 10
  %28 = 0
  br label B18

B17:
  %30 = 5
  %32 = 0
  %31 = -5
  %33 = 0
  br label B19

B18:
  %34 = 0
  br label B19

B19:
  %6 = 0
  br label B21

B20:
  %37 = 15
  %38 = 20
  br label B22

B21:
  %41 = 0
  %40 = -5
  br label B22

B22:
  %7 = 20
  br label B15

}
