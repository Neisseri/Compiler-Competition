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
  br label B1

B1:
  %8 = 0
  br label B3

B2:
  br label B4

B3:
  br label B4

B4:
  br label B5

B5:
  ret i32 %2

B6:
  br label B9

B7:
  ret i32 %9

B9:
  br label B11

B10:
  br label B12

B11:
  br label B12

B12:
  br label B14

B13:
  br label B15

B14:
  br label B16

B15:
  %8 = phi i32 [ %6, B22 ]
  br label B7

B16:
  br label B18

B17:
  br label B19

B18:
  br label B19

B19:
  br label B21

B20:
  br label B22

B21:
  br label B22

B22:
  br label B15

}
