; module
@a#0 = global int, 4
@b#0 = global int, 4
@d#0 = global int, 4
define i32 @main(){
B6:
  %r1 = add i32 0, 2 ; loadint
  %r2 = loadaddr @a#0
  store i32 %r1, ptr %r2
  %r3 = add i32 0, 3 ; loadint
  %r4 = loadaddr @b#0
  store i32 %r3, ptr %r4
  br label %B7

B7:
  %r5 = alloca int, 4
  %r7 = add i32 0, 0 ; loadint
  %r6 = call i32 @set_a(i32 %r7)
  br i1 %r6, label %B8, label %B9

B8:
  %r9 = add i32 0, 1 ; loadint
  %r8 = call i32 @set_b(i32 %r9)
  store i32 %r8, ptr %r5
  br label %B10

B9:
  %r10 = add i32 0, 0 ; loadint
  store i32 %r10, ptr %r5
  br label %B10

B10:
  %r11 = load i32, ptr %r5
  br i1 %r11, label %B11, label %B12

B11:
  br label %B12

B12:
  %r13 = loadaddr @a#0
  %r14 = load i32, ptr %r13
  %r12 = call i32 @putint(i32 %r14)
  %r16 = add i32 0, 32 ; loadint
  %r15 = call i32 @putch(i32 %r16)
  %r18 = loadaddr @b#0
  %r19 = load i32, ptr %r18
  %r17 = call i32 @putint(i32 %r19)
  %r21 = add i32 0, 32 ; loadint
  %r20 = call i32 @putch(i32 %r21)
  %r22 = add i32 0, 2 ; loadint
  %r23 = loadaddr @a#0
  store i32 %r22, ptr %r23
  %r24 = add i32 0, 3 ; loadint
  %r25 = loadaddr @b#0
  store i32 %r24, ptr %r25
  br label %B13

B13:
  %r26 = alloca int, 4
  %r28 = add i32 0, 0 ; loadint
  %r27 = call i32 @set_a(i32 %r28)
  br i1 %r27, label %B14, label %B15

B14:
  %r30 = add i32 0, 1 ; loadint
  %r29 = call i32 @set_b(i32 %r30)
  store i32 %r29, ptr %r26
  br label %B16

B15:
  %r31 = add i32 0, 0 ; loadint
  store i32 %r31, ptr %r26
  br label %B16

B16:
  %r32 = load i32, ptr %r26
  br i1 %r32, label %B17, label %B18

B17:
  br label %B18

B18:
  %r34 = loadaddr @a#0
  %r35 = load i32, ptr %r34
  %r33 = call i32 @putint(i32 %r35)
  %r37 = add i32 0, 32 ; loadint
  %r36 = call i32 @putch(i32 %r37)
  %r39 = loadaddr @b#0
  %r40 = load i32, ptr %r39
  %r38 = call i32 @putint(i32 %r40)
  %r42 = add i32 0, 10 ; loadint
  %r41 = call i32 @putch(i32 %r42)
  %r43 = alloca const int, 4
  %r44 = add i32 0, 1 ; loadint
  store i32 %r44, ptr %r43
  %r45 = add i32 0, 2 ; loadint
  %r46 = loadaddr @d#0
  store i32 %r45, ptr %r46
  br label %B19

B19:
  %r47 = alloca int, 4
  %r48 = load i32, ptr %r43
  %r49 = add i32 0, 1 ; loadint
  %r50 = icmp sge i32 %r48, %r49
  br i1 %r50, label %B20, label %B21

B20:
  %r52 = add i32 0, 3 ; loadint
  %r51 = call i32 @set_d(i32 %r52)
  store i32 %r51, ptr %r47
  br label %B22

B21:
  %r53 = add i32 0, 0 ; loadint
  store i32 %r53, ptr %r47
  br label %B22

B22:
  %r54 = load i32, ptr %r47
  br i1 %r54, label %B23, label %B24

B23:
  br label %B24

B24:
  %r56 = loadaddr @d#0
  %r57 = load i32, ptr %r56
  %r55 = call i32 @putint(i32 %r57)
  %r59 = add i32 0, 32 ; loadint
  %r58 = call i32 @putch(i32 %r59)
  br label %B25

B25:
  %r60 = alloca int, 4
  %r61 = load i32, ptr %r43
  %r62 = add i32 0, 1 ; loadint
  %r63 = icmp sle i32 %r61, %r62
  br i1 %r63, label %B26, label %B27

B26:
  %r66 = add i32 0, 1 ; loadint
  store i32 %r66, ptr %r60
  br label %B28

B27:
  %r65 = add i32 0, 4 ; loadint
  %r64 = call i32 @set_d(i32 %r65)
  store i32 %r64, ptr %r60
  br label %B28

B28:
  %r67 = load i32, ptr %r60
  br i1 %r67, label %B29, label %B30

B29:
  br label %B30

B30:
  %r69 = loadaddr @d#0
  %r70 = load i32, ptr %r69
  %r68 = call i32 @putint(i32 %r70)
  %r72 = add i32 0, 10 ; loadint
  %r71 = call i32 @putch(i32 %r72)
  br label %B31

B31:
  %r73 = add i32 0, 16 ; loadint
  %r74 = add i32 0, 3 ; loadint
  %r75 = add i32 0, 2 ; loadint
  %r76 = add i32 0, 1 ; loadint
  %r77 = add i32 %r75, %r76
  %r78 = sub i32 %r74, %r77
  %r79 = icmp sge i32 %r73, %r78
  br i1 %r79, label %B32, label %B33

B32:
  %r81 = add i32 0, 65 ; loadint
  %r80 = call i32 @putch(i32 %r81)
  br label %B33

B33:
  br label %B34

B34:
  %r82 = add i32 0, 25 ; loadint
  %r83 = add i32 0, 7 ; loadint
  %r84 = sub i32 %r82, %r83
  %r85 = add i32 0, 36 ; loadint
  %r86 = add i32 0, 6 ; loadint
  %r87 = add i32 0, 3 ; loadint
  %r88 = mul i32 %r86, %r87
  %r89 = sub i32 %r85, %r88
  %r90 = icmp ne i32 %r84, %r89
  br i1 %r90, label %B35, label %B36

B35:
  %r92 = add i32 0, 66 ; loadint
  %r91 = call i32 @putch(i32 %r92)
  br label %B36

B36:
  br label %B37

B37:
  %r93 = add i32 0, 1 ; loadint
  %r94 = add i32 0, 8 ; loadint
  %r95 = icmp slt i32 %r93, %r94
  %r96 = add i32 0, 7 ; loadint
  %r97 = add i32 0, 2 ; loadint
  %r98 = srem i32 %r96, %r97
  %r99 = icmp ne i32 %r95, %r98
  br i1 %r99, label %B38, label %B39

B38:
  %r101 = add i32 0, 67 ; loadint
  %r100 = call i32 @putch(i32 %r101)
  br label %B39

B39:
  br label %B40

B40:
  %r102 = add i32 0, 3 ; loadint
  %r103 = add i32 0, 4 ; loadint
  %r104 = icmp sgt i32 %r102, %r103
  %r105 = add i32 0, 0 ; loadint
  %r106 = icmp eq i32 %r104, %r105
  br i1 %r106, label %B41, label %B42

B41:
  %r108 = add i32 0, 68 ; loadint
  %r107 = call i32 @putch(i32 %r108)
  br label %B42

B42:
  br label %B43

B43:
  %r109 = add i32 0, 1 ; loadint
  %r110 = add i32 0, 102 ; loadint
  %r111 = add i32 0, 63 ; loadint
  %r112 = icmp sle i32 %r110, %r111
  %r113 = icmp eq i32 %r109, %r112
  br i1 %r113, label %B44, label %B45

B44:
  %r115 = add i32 0, 69 ; loadint
  %r114 = call i32 @putch(i32 %r115)
  br label %B45

B45:
  br label %B46

B46:
  %r116 = add i32 0, 5 ; loadint
  %r117 = add i32 0, 6 ; loadint
  %r118 = sub i32 %r116, %r117
  %r119 = add i32 0, 0 ; loadint
  %r121 = add i32 0, 0 ; loadint
  %r120 = icmp eq i32 %r121, %r119
  %r123 = add i32 0, 0 ; loadint
  %r122 = sub i32 %r123, %r120
  %r124 = icmp eq i32 %r118, %r122
  br i1 %r124, label %B47, label %B48

B47:
  %r126 = add i32 0, 70 ; loadint
  %r125 = call i32 @putch(i32 %r126)
  br label %B48

B48:
  %r128 = add i32 0, 10 ; loadint
  %r127 = call i32 @putch(i32 %r128)
  %r129 = alloca int, 4
  %r130 = add i32 0, 0 ; loadint
  store i32 %r130, ptr %r129
  %r131 = alloca int, 4
  %r132 = add i32 0, 1 ; loadint
  store i32 %r132, ptr %r131
  %r133 = alloca int, 4
  %r134 = add i32 0, 2 ; loadint
  store i32 %r134, ptr %r133
  %r135 = alloca int, 4
  %r136 = add i32 0, 3 ; loadint
  store i32 %r136, ptr %r135
  %r137 = alloca int, 4
  %r138 = add i32 0, 4 ; loadint
  store i32 %r138, ptr %r137
  br label %B49

B49:
  %r139 = alloca int, 4
  %r140 = load i32, ptr %r129
  br i1 %r140, label %B52, label %B53

B50:
  %r145 = add i32 0, 32 ; loadint
  %r144 = call i32 @putch(i32 %r145)
  br label %B49

B51:
  br label %B55

B52:
  %r141 = load i32, ptr %r131
  store i32 %r141, ptr %r139
  br label %B54

B53:
  %r142 = add i32 0, 0 ; loadint
  store i32 %r142, ptr %r139
  br label %B54

B54:
  %r143 = load i32, ptr %r139
  br i1 %r143, label %B50, label %B51

B55:
  %r146 = alloca int, 4
  %r147 = load i32, ptr %r129
  br i1 %r147, label %B56, label %B57

B56:
  %r149 = add i32 0, 1 ; loadint
  store i32 %r149, ptr %r146
  br label %B58

B57:
  %r148 = load i32, ptr %r131
  store i32 %r148, ptr %r146
  br label %B58

B58:
  %r150 = load i32, ptr %r146
  br i1 %r150, label %B59, label %B60

B59:
  %r152 = add i32 0, 67 ; loadint
  %r151 = call i32 @putch(i32 %r152)
  br label %B60

B60:
  br label %B61

B61:
  %r153 = alloca int, 4
  %r154 = load i32, ptr %r129
  %r155 = load i32, ptr %r131
  %r156 = icmp sge i32 %r154, %r155
  br i1 %r156, label %B62, label %B63

B62:
  %r160 = add i32 0, 1 ; loadint
  store i32 %r160, ptr %r153
  br label %B64

B63:
  %r157 = load i32, ptr %r131
  %r158 = load i32, ptr %r129
  %r159 = icmp sle i32 %r157, %r158
  store i32 %r159, ptr %r153
  br label %B64

B64:
  %r161 = load i32, ptr %r153
  br i1 %r161, label %B65, label %B66

B65:
  %r163 = add i32 0, 72 ; loadint
  %r162 = call i32 @putch(i32 %r163)
  br label %B66

B66:
  br label %B67

B67:
  %r164 = alloca int, 4
  %r165 = load i32, ptr %r133
  %r166 = load i32, ptr %r131
  %r167 = icmp sge i32 %r165, %r166
  br i1 %r167, label %B68, label %B69

B68:
  %r168 = load i32, ptr %r137
  %r169 = load i32, ptr %r135
  %r170 = icmp ne i32 %r168, %r169
  store i32 %r170, ptr %r164
  br label %B70

B69:
  %r171 = add i32 0, 0 ; loadint
  store i32 %r171, ptr %r164
  br label %B70

B70:
  %r172 = load i32, ptr %r164
  br i1 %r172, label %B71, label %B72

B71:
  %r174 = add i32 0, 73 ; loadint
  %r173 = call i32 @putch(i32 %r174)
  br label %B72

B72:
  br label %B73

B73:
  %r175 = alloca int, 4
  %r176 = alloca int, 4
  %r177 = load i32, ptr %r129
  %r178 = load i32, ptr %r131
  %r180 = add i32 0, 0 ; loadint
  %r179 = icmp eq i32 %r180, %r178
  %r181 = icmp eq i32 %r177, %r179
  br i1 %r181, label %B74, label %B75

B74:
  %r182 = load i32, ptr %r135
  %r183 = load i32, ptr %r135
  %r184 = icmp slt i32 %r182, %r183
  store i32 %r184, ptr %r176
  br label %B76

B75:
  %r185 = add i32 0, 0 ; loadint
  store i32 %r185, ptr %r176
  br label %B76

B76:
  %r186 = load i32, ptr %r176
  br i1 %r186, label %B77, label %B78

B77:
  %r190 = add i32 0, 1 ; loadint
  store i32 %r190, ptr %r175
  br label %B79

B78:
  %r187 = load i32, ptr %r137
  %r188 = load i32, ptr %r137
  %r189 = icmp sge i32 %r187, %r188
  store i32 %r189, ptr %r175
  br label %B79

B79:
  %r191 = load i32, ptr %r175
  br i1 %r191, label %B80, label %B81

B80:
  %r193 = add i32 0, 74 ; loadint
  %r192 = call i32 @putch(i32 %r193)
  br label %B81

B81:
  br label %B82

B82:
  %r194 = alloca int, 4
  %r195 = load i32, ptr %r129
  %r196 = load i32, ptr %r131
  %r198 = add i32 0, 0 ; loadint
  %r197 = icmp eq i32 %r198, %r196
  %r199 = icmp eq i32 %r195, %r197
  br i1 %r199, label %B83, label %B84

B83:
  %r209 = add i32 0, 1 ; loadint
  store i32 %r209, ptr %r194
  br label %B85

B84:
  %r200 = alloca int, 4
  %r201 = load i32, ptr %r135
  %r202 = load i32, ptr %r135
  %r203 = icmp slt i32 %r201, %r202
  br i1 %r203, label %B86, label %B87

B85:
  %r210 = load i32, ptr %r194
  br i1 %r210, label %B89, label %B90

B86:
  %r204 = load i32, ptr %r137
  %r205 = load i32, ptr %r137
  %r206 = icmp sge i32 %r204, %r205
  store i32 %r206, ptr %r200
  br label %B88

B87:
  %r207 = add i32 0, 0 ; loadint
  store i32 %r207, ptr %r200
  br label %B88

B88:
  %r208 = load i32, ptr %r200
  store i32 %r208, ptr %r194
  br label %B85

B89:
  %r212 = add i32 0, 75 ; loadint
  %r211 = call i32 @putch(i32 %r212)
  br label %B90

B90:
  %r214 = add i32 0, 10 ; loadint
  %r213 = call i32 @putch(i32 %r214)
  %r215 = add i32 0, 0 ; loadint
  ret i32 %r215

}
define i32 @set_d(i32){
B4:
  %r2 = alloca int, 4
  store i32 %r1, ptr %r2
  %r3 = load i32, ptr %r2
  %r4 = loadaddr @d#0
  store i32 %r3, ptr %r4
  %r5 = loadaddr @d#0
  %r6 = load i32, ptr %r5
  ret i32 %r6

}
define i32 @set_b(i32){
B2:
  %r2 = alloca int, 4
  store i32 %r1, ptr %r2
  %r3 = load i32, ptr %r2
  %r4 = loadaddr @b#0
  store i32 %r3, ptr %r4
  %r5 = loadaddr @b#0
  %r6 = load i32, ptr %r5
  ret i32 %r6

}
define i32 @set_a(i32){
B0:
  %r2 = alloca int, 4
  store i32 %r1, ptr %r2
  %r3 = load i32, ptr %r2
  %r4 = loadaddr @a#0
  store i32 %r3, ptr %r4
  %r5 = loadaddr @a#0
  %r6 = load i32, ptr %r5
  ret i32 %r6

}
