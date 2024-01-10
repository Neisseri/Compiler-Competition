; module
define i32 @main(){
B2:
  %r1 = alloca i32, i32 4
  %r2 = alloca i32, i32 4
  %r3 = alloca i32, i32 4
  %r4 = alloca i32, i32 4
  %r5 = add i32 0, 0 ; loadint
  store i32 %r5, ptr %r4
  %r6 = alloca i32, i32 4
  %r7 = add i32 0, 0 ; loadint
  store i32 %r7, ptr %r6
  br label %B3

B3:
  %r8 = load i32, ptr %r6
  %r9 = add i32 0, 2 ; loadint
  %tmpcmp10 = icmp slt i32 %r8, %r9
  %r10 = zext i1 %tmpcmp10 to i32
  %tmpconbr10 = trunc i32 %r10 to i1
  br i1 %tmpconbr10, label %B4, label %B5

B4:
  %r11 = add i32 0, 1 ; loadint
  store i32 %r11, ptr %r2
  %r12 = add i32 0, 2 ; loadint
  store i32 %r12, ptr %r3
  br label %B6

B5:
  %r44 = add i32 0, 0 ; loadint
  ret i32 %r44

B6:
  %r13 = add i32 0, 0 ; loadint
  %tmpconbr13 = trunc i32 %r13 to i1
  br i1 %tmpconbr13, label %B7, label %B8

B7:
  %r14 = alloca i32, i32 4
  %r15 = load i32, ptr %r2
  %r16 = load i32, ptr %r3
  %r17 = add i32 %r15, %r16
  store i32 %r17, ptr %r14
  br label %B9

B8:
  %r41 = load i32, ptr %r6
  %r42 = add i32 0, 2 ; loadint
  %r43 = add i32 %r41, %r42
  store i32 %r43, ptr %r6
  br label %B3

B9:
  %r18 = alloca i32, i32 4
  %r19 = add i32 0, 0 ; loadint
  %tmpconbr19 = trunc i32 %r19 to i1
  br i1 %tmpconbr19, label %B10, label %B11

B10:
  %r20 = add i32 0, 0 ; loadint
  store i32 %r20, ptr %r18
  br label %B12

B11:
  %r21 = add i32 0, 0 ; loadint
  store i32 %r21, ptr %r18
  br label %B12

B12:
  %r22 = load i32, ptr %r18
  %tmpconbr22 = trunc i32 %r22 to i1
  br i1 %tmpconbr22, label %B13, label %B14

B13:
  br label %B14

B14:
  br label %B15

B15:
  %r23 = alloca i32, i32 4
  %r24 = add i32 0, 0 ; loadint
  %tmpconbr24 = trunc i32 %r24 to i1
  br i1 %tmpconbr24, label %B16, label %B17

B16:
  %r25 = add i32 0, 0 ; loadint
  store i32 %r25, ptr %r23
  br label %B18

B17:
  %r26 = add i32 0, 0 ; loadint
  store i32 %r26, ptr %r23
  br label %B18

B18:
  %r27 = load i32, ptr %r23
  %tmpconbr27 = trunc i32 %r27 to i1
  br i1 %tmpconbr27, label %B19, label %B20

B19:
  %r28 = call i32 @init()
  br label %B20

B20:
  br label %B21

B21:
  %r29 = alloca i32, i32 4
  %r30 = alloca i32, i32 4
  %r31 = add i32 0, 0 ; loadint
  %tmpconbr31 = trunc i32 %r31 to i1
  br i1 %tmpconbr31, label %B22, label %B23

B22:
  %r32 = add i32 0, 0 ; loadint
  store i32 %r32, ptr %r30
  br label %B24

B23:
  %r33 = add i32 0, 0 ; loadint
  store i32 %r33, ptr %r30
  br label %B24

B24:
  %r34 = load i32, ptr %r30
  %tmpconbr34 = trunc i32 %r34 to i1
  br i1 %tmpconbr34, label %B25, label %B26

B25:
  %r35 = add i32 0, 0 ; loadint
  store i32 %r35, ptr %r29
  br label %B27

B26:
  %r36 = add i32 0, 0 ; loadint
  store i32 %r36, ptr %r29
  br label %B27

B27:
  %r37 = load i32, ptr %r29
  %tmpconbr37 = trunc i32 %r37 to i1
  br i1 %tmpconbr37, label %B28, label %B29

B28:
  %r38 = add i32 0, 1 ; loadint
  store i32 %r38, ptr %r4
  %r39 = alloca i32, i32 4
  %r40 = add i32 0, 1 ; loadint
  store i32 %r40, ptr %r39
  br label %B29

B29:
  br label %B8

}
define i32 @init(){
B0:
  %r1 = add i32 0, 0 ; loadint
  ret i32 %r1

}
