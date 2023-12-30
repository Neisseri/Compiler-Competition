; module
@a#0 = global int, 4
@b#0 = global int, 4
@c#0 = global int, 4
@d#0 = global int, 4
@e#0 = global int, 4
define i32 @main(){
B0:
  %r1 = call i32 @getint()
  %r2 = loadaddr @a#0
  store i32 %r1, ptr %r2
  %r3 = call i32 @getint()
  %r4 = loadaddr @b#0
  store i32 %r3, ptr %r4
  %r5 = call i32 @getint()
  %r6 = loadaddr @c#0
  store i32 %r5, ptr %r6
  %r7 = call i32 @getint()
  %r8 = loadaddr @d#0
  store i32 %r7, ptr %r8
  %r9 = call i32 @getint()
  %r10 = loadaddr @e#0
  store i32 %r9, ptr %r10
  %r11 = alloca int, 4
  %r12 = add i32 0, 0 ; loadint
  store i32 %r12, ptr %r11
  br label %B1

B1:
  %r13 = alloca int, 4
  %r14 = alloca int, 4
  %r15 = loadaddr @a#0
  %r16 = load i32, ptr %r15
  %r17 = loadaddr @b#0
  %r18 = load i32, ptr %r17
  %r19 = loadaddr @c#0
  %r20 = load i32, ptr %r19
  %r21 = mul i32 %r18, %r20
  %r22 = sub i32 %r16, %r21
  %r23 = loadaddr @d#0
  %r24 = load i32, ptr %r23
  %r25 = loadaddr @a#0
  %r26 = load i32, ptr %r25
  %r27 = loadaddr @c#0
  %r28 = load i32, ptr %r27
  %r29 = sdiv i32 %r26, %r28
  %r30 = sub i32 %r24, %r29
  %r31 = icmp ne i32 %r22, %r30
  br i1 %r31, label %B2, label %B3

B2:
  %r46 = add i32 0, 1 ; loadint
  store i32 %r46, ptr %r14
  br label %B4

B3:
  %r32 = loadaddr @a#0
  %r33 = load i32, ptr %r32
  %r34 = loadaddr @b#0
  %r35 = load i32, ptr %r34
  %r36 = mul i32 %r33, %r35
  %r37 = loadaddr @c#0
  %r38 = load i32, ptr %r37
  %r39 = sdiv i32 %r36, %r38
  %r40 = loadaddr @e#0
  %r41 = load i32, ptr %r40
  %r42 = loadaddr @d#0
  %r43 = load i32, ptr %r42
  %r44 = add i32 %r41, %r43
  %r45 = icmp eq i32 %r39, %r44
  store i32 %r45, ptr %r14
  br label %B4

B4:
  %r47 = load i32, ptr %r14
  br i1 %r47, label %B5, label %B6

B5:
  %r62 = add i32 0, 1 ; loadint
  store i32 %r62, ptr %r13
  br label %B7

B6:
  %r48 = loadaddr @a#0
  %r49 = load i32, ptr %r48
  %r50 = loadaddr @b#0
  %r51 = load i32, ptr %r50
  %r52 = add i32 %r49, %r51
  %r53 = loadaddr @c#0
  %r54 = load i32, ptr %r53
  %r55 = add i32 %r52, %r54
  %r56 = loadaddr @d#0
  %r57 = load i32, ptr %r56
  %r58 = loadaddr @e#0
  %r59 = load i32, ptr %r58
  %r60 = add i32 %r57, %r59
  %r61 = icmp eq i32 %r55, %r60
  store i32 %r61, ptr %r13
  br label %B7

B7:
  %r63 = load i32, ptr %r13
  br i1 %r63, label %B8, label %B9

B8:
  %r64 = add i32 0, 1 ; loadint
  store i32 %r64, ptr %r11
  br label %B9

B9:
  %r65 = load i32, ptr %r11
  ret i32 %r65

}
