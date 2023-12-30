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
  %8 = icmp eq i32 %2, %7
  br i32 %8, label B2, label B3

B2:
  %12 = 1
  br label B4

B3:
  %10 = 11
  %11 = icmp eq i32 %4, %10
  br label B4

B4:
  %4 = phi i32 [ %12, B2 ], [ %11, B3 ]
  br i32 %4, label B5, label B6

B5:
  ret i32 %2

B6:
  br label B9

B7:
  ret i32 %9

B9:
  %17 = 10
  %18 = icmp eq i32 %4, %17
  br i32 %18, label B10, label B11

B10:
  %20 = 1
  %21 = icmp eq i32 %2, %20
  br label B12

B11:
  %22 = 0
  br label B12

B12:
  %5 = phi i32 [ %21, B10 ], [ %22, B11 ]
  br i32 %5, label B13, label B14

B13:
  %24 = 25
  br label B15

B14:
  br label B16

B15:
  %8 = phi i32 [ %6, B22 ]
  %9 = phi i32 [ %24, B13 ], [ %7, B22 ]
  br label B7

B16:
  %27 = 10
  %28 = icmp eq i32 %4, %27
  br i32 %28, label B17, label B18

B17:
  %30 = 5
  %32 = 0
  %31 = sub i32 %32, %30
  %33 = icmp eq i32 %2, %31
  br label B19

B18:
  %34 = 0
  br label B19

B19:
  %6 = phi i32 [ %33, B17 ], [ %34, B18 ]
  br i32 %6, label B20, label B21

B20:
  %37 = 15
  %38 = add i32 %2, %37
  br label B22

B21:
  %41 = 0
  %40 = sub i32 %41, %2
  br label B22

B22:
  %7 = phi i32 [ %38, B20 ], [ %40, B21 ]
  br label B15

}
