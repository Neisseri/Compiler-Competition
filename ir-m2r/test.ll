; module
@array = global i32, i32 4
@n = global i32, i32 4
define i32 @main(){
B2:
  %r2 = add i32 0, 1 ; loadint
  br label %B3

B3:
  %r108 = phi tmp#10 i32 [ %r107, %B23 ]
  %r104 = phi t#4 i32 [ %r2, %B2 ], [ %r8, %B23 ]
  %r103 = phi logic_expr@#38 i32 [ %r102, %B23 ]
  %r99 = phi logic_expr@#37 i32 [ %r98, %B23 ]
  %r95 = phi loc#9 i32 [ %r94, %B23 ]
  %r92 = phi k#6 i32 [ %r19, %B23 ]
  %r90 = phi i#6 i32 [ %r91, %B23 ]
  %r86 = phi flag#6 i32 [ %r89, %B23 ]
  %r85 = phi b#4 i32 [ %r84, %B23 ]
  %r83 = phi a#4 i32 [ %r82, %B23 ]
  br i1 %r104, label %B4, label %B5

B4:
  %r7 = add i32 0, 1 ; loadint
  %r8 = sub i32 %r104, %r7
  %r9 = add i32 0, 1 ; loadint
  %r10 = loadaddr @n#0
  store n#0 i32 %r9, ptr %r10
  %r12 = add i32 0, 0 ; loadint
  %r14 = add i32 0, 0 ; loadint
  %r16 = loadaddr @n#0
  %r17 = load n#0 i32, ptr %r16
  %r15 = call i32 @init(i32 %r17)
  %r19 = add i32 0, 17 ; loadint
  br label %B6

B5:
  %r81 = add i32 0, 0 ; loadint
  ret i32 %r81

B6:
  %r107 = phi tmp#10 i32 [ %r108, %B4 ], [ %r106, %B11 ]
  %r102 = phi logic_expr@#38 i32 [ %r103, %B4 ], [ %r101, %B11 ]
  %r98 = phi logic_expr@#37 i32 [ %r99, %B4 ], [ %r97, %B11 ]
  %r94 = phi loc#9 i32 [ %r95, %B4 ], [ %r93, %B11 ]
  %r91 = phi i#6 i32 [ %r12, %B4 ], [ %r73, %B11 ]
  %r89 = phi flag#6 i32 [ %r14, %B4 ], [ %r88, %B11 ]
  %r84 = phi b#4 i32 [ %r85, %B4 ], [ %r24, %B11 ]
  %r82 = phi a#4 i32 [ %r83, %B4 ], [ %r23, %B11 ]
  %r21 = add i32 0, 10 ; loadint
  %r22 = icmp slt i32 %r91, %r21
  br i1 %r22, label %B7, label %B8

B7:
  %r23 = add i32 0, 1 ; loadint
  %r24 = add i32 0, 2 ; loadint
  br label %B9

B8:
  br label %B21

B9:
  %r27 = add i32 0, 0 ; loadint
  %r26 = icmp eq i32 %r27, %r89
  br i1 %r26, label %B10, label %B11

B10:
  %r29 = loadaddr @n#0
  %r30 = load n#0 i32, ptr %r29
  %r32 = add i32 0, 1 ; loadint
  %r33 = sub i32 %r23, %r32
  %r34 = mul i32 %r30, %r33
  %r36 = add i32 %r34, %r24
  br label %B12

B11:
  %r106 = phi tmp#10 i32 [ %r107, %B9 ], [ %r105, %B20 ]
  %r101 = phi logic_expr@#38 i32 [ %r102, %B9 ], [ %r100, %B20 ]
  %r97 = phi logic_expr@#37 i32 [ %r98, %B9 ], [ %r96, %B20 ]
  %r93 = phi loc#9 i32 [ %r94, %B9 ], [ %r36, %B20 ]
  %r88 = phi flag#6 i32 [ %r89, %B9 ], [ %r87, %B20 ]
  %r72 = add i32 0, 1 ; loadint
  %r73 = add i32 %r91, %r72
  br label %B6

B12:
  %r39 = loadaddr @array#0
  %r40 = add i32 0, 4 ; loadint
  %r41 = add i32 0, 0 ; loadint
  %r42 = mul i32 %r41, %r40
  %r43 = add i32 %r39, %r42
  %r44 = load array#0 i32, ptr %r43
  %r45 = add i32 0, 1 ; loadint
  %r47 = add i32 0, 0 ; loadint
  %r46 = sub i32 %r47, %r45
  %r48 = icmp ne i32 %r44, %r46
  br i1 %r48, label %B13, label %B14

B13:
  %r49 = loadaddr @array#0
  %r50 = add i32 0, 4 ; loadint
  %r52 = mul i32 %r19, %r50
  %r53 = add i32 %r49, %r52
  %r54 = load array#0 i32, ptr %r53
  %r55 = add i32 0, 1 ; loadint
  %r57 = add i32 0, 0 ; loadint
  %r56 = sub i32 %r57, %r55
  %r58 = icmp ne i32 %r54, %r56
  br label %B15

B14:
  %r59 = add i32 0, 0 ; loadint
  br label %B15

B15:
  %r100 = phi logic_expr@#38 i32 [ %r58, %B13 ], [ %r59, %B14 ]
  br i1 %r100, label %B16, label %B17

B16:
  %r61 = add i32 0, 0 ; loadint
  %r63 = icmp eq i32 %r61, %r19
  br label %B18

B17:
  %r64 = add i32 0, 0 ; loadint
  br label %B18

B18:
  %r96 = phi logic_expr@#37 i32 [ %r63, %B16 ], [ %r64, %B17 ]
  br i1 %r96, label %B19, label %B20

B19:
  %r66 = add i32 0, 1 ; loadint
  %r69 = add i32 0, 1 ; loadint
  %r70 = add i32 %r91, %r69
  br label %B20

B20:
  %r105 = phi tmp#10 i32 [ %r107, %B18 ], [ %r70, %B19 ]
  %r87 = phi flag#6 i32 [ %r89, %B18 ], [ %r66, %B19 ]
  br label %B11

B21:
  %r76 = add i32 0, 0 ; loadint
  %r75 = icmp eq i32 %r76, %r89
  br i1 %r75, label %B22, label %B23

B22:
  %r78 = add i32 0, 1 ; loadint
  %r80 = add i32 0, 0 ; loadint
  %r79 = sub i32 %r80, %r78
  %r77 = call i32 @putint(i32 %r79)
  br label %B23

B23:
  br label %B3

}
define void @init(i32 %r1){
B0:
  %r3 = add i32 0, 0 ; loadint
  ret i32 %r3

}
