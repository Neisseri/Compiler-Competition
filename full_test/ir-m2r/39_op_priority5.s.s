; module
@a#0 = global int 1, 4
@b#0 = global int 0, 4
@c#0 = global int 1, 4
@d#0 = global int 2, 4
@e#0 = global int 4, 4
define i32 @main(){
B0:
  %r2 = add i32 0, 0 ; loadint
  br label %B1

B1:
  %r5 = loadaddr @a#0
  %r6 = load i32, ptr %r5
  %r7 = loadaddr @b#0
  %r8 = load i32, ptr %r7
  %r9 = mul i32 %r6, %r8
  %r10 = loadaddr @c#0
  %r11 = load i32, ptr %r10
  %r12 = sdiv i32 %r9, %r11
  %r13 = loadaddr @e#0
  %r14 = load i32, ptr %r13
  %r15 = loadaddr @d#0
  %r16 = load i32, ptr %r15
  %r17 = add i32 %r14, %r16
  %r18 = icmp eq i32 %r12, %r17
  br i1 %r18, label %B2, label %B3

B2:
  %r19 = loadaddr @a#0
  %r20 = load i32, ptr %r19
  %r21 = loadaddr @a#0
  %r22 = load i32, ptr %r21
  %r23 = loadaddr @b#0
  %r24 = load i32, ptr %r23
  %r25 = add i32 %r22, %r24
  %r26 = mul i32 %r20, %r25
  %r27 = loadaddr @c#0
  %r28 = load i32, ptr %r27
  %r29 = add i32 %r26, %r28
  %r30 = loadaddr @d#0
  %r31 = load i32, ptr %r30
  %r32 = loadaddr @e#0
  %r33 = load i32, ptr %r32
  %r34 = add i32 %r31, %r33
  %r35 = icmp sle i32 %r29, %r34
  br label %B4

B3:
  %r36 = add i32 0, 0 ; loadint
  br label %B4

B4:
  %r63 = phi i32 [ %r35, %B2 ], [ %r36, %B3 ]
  br i1 %r63, label %B5, label %B6

B5:
  %r55 = add i32 0, 1 ; loadint
  br label %B7

B6:
  %r38 = loadaddr @a#0
  %r39 = load i32, ptr %r38
  %r40 = loadaddr @b#0
  %r41 = load i32, ptr %r40
  %r42 = loadaddr @c#0
  %r43 = load i32, ptr %r42
  %r44 = mul i32 %r41, %r43
  %r45 = sub i32 %r39, %r44
  %r46 = loadaddr @d#0
  %r47 = load i32, ptr %r46
  %r48 = loadaddr @a#0
  %r49 = load i32, ptr %r48
  %r50 = loadaddr @c#0
  %r51 = load i32, ptr %r50
  %r52 = sdiv i32 %r49, %r51
  %r53 = sub i32 %r47, %r52
  %r54 = icmp eq i32 %r45, %r53
  br label %B7

B7:
  %r62 = phi i32 [ %r55, %B5 ], [ %r54, %B6 ]
  br i1 %r62, label %B8, label %B9

B8:
  %r57 = add i32 0, 1 ; loadint
  br label %B9

B9:
  %r61 = phi i32 [ %r2, %B7 ], [ %r57, %B8 ]
  %r58 = call i32 @putint(i32 %r61)
  ret i32 %r61

}
