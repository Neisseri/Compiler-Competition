; module
define i32 @main(){
B0:
  %2 = 4
  br label B1

B1:
  %4 = 75
  %5 = icmp slt i32 %2, %4
  br i32 %5, label B2, label B3

B2:
  %7 = 42
  br label B4

B3:
  %25 = phi i32 [ %23, B6 ]
  %26 = phi i32 [ %7, B6 ]
  %27 = phi i32 [ %2, B1 ], [ %24, B6 ]
  ret i32 %27

B4:
  %9 = 100
  %10 = icmp slt i32 %2, %9
  br i32 %10, label B5, label B6

B5:
  %12 = 42
  %13 = add i32 %2, %12
  br label B7

B6:
  %23 = phi i32 [ %21, B9 ]
  %24 = phi i32 [ %2, B4 ], [ %22, B9 ]
  br label B3

B7:
  %15 = 99
  %16 = icmp sgt i32 %13, %15
  br i32 %16, label B8, label B9

B8:
  %18 = 84
  %19 = 168
  br label B9

B9:
  %21 = phi i32 [ %18, B8 ]
  %22 = phi i32 [ %13, B7 ], [ %19, B8 ]
  br label B6

}
