; module
define i32 @main(){
B8:
  %r2 = add i32 0, 0 ; loadint
  %r3 = add i32 0, 1 ; loadint
  %r1 = call i32 @QuickSort(i32 %r2, i32 %r3)
  %r4 = add i32 0, 0 ; loadint
  ret i32 %r4

}
define i32 @QuickSort(i32 %r1, i32 %r2){
B0:
  br label %B1

B1:
  %r7 = icmp slt i32 %r1, %r2
  br i1 %r7, label %B2, label %B3

B2:
  br label %B4

B3:
  %r31 = phi j#3 i32 [ %r2, %B6 ]
  %r29 = phi i#3 i32 [ %r30, %B6 ]
  %r28 = add i32 0, 0 ; loadint
  ret i32 %r28

B4:
  %r30 = phi i#3 i32 [ %r1, %B2 ], [ %r17, %B5 ]
  %r14 = icmp slt i32 %r30, %r2
  br i1 %r14, label %B5, label %B6

B5:
  %r16 = add i32 0, 1 ; loadint
  %r17 = add i32 %r30, %r16
  br label %B4

B6:
  %r21 = add i32 0, 1 ; loadint
  %r22 = sub i32 %r30, %r21
  %r18 = call i32 @QuickSort(i32 %r1, i32 %r22)
  %r25 = add i32 0, 1 ; loadint
  %r26 = add i32 %r30, %r25
  %r23 = call i32 @QuickSort(i32 %r26, i32 %r2)
  br label %B3

}
