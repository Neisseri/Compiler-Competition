; module
@a#0 = global int, 4
@b#0 = global int, 4
define i32 @main(){
B0:
  %r1 = call i32 @getint()
  %r2 = loadaddr @a#0
  store i32 %r1, ptr %r2
  %r3 = call i32 @getint()
  %r4 = loadaddr @b#0
  store i32 %r3, ptr %r4
  br label %B1

B1:
  %r7 = loadaddr @a#0
  %r8 = load i32, ptr %r7
  %r9 = loadaddr @b#0
  %r10 = load i32, ptr %r9
  %r11 = icmp eq i32 %r8, %r10
  br i1 %r11, label %B2, label %B3

B2:
  %r12 = loadaddr @a#0
  %r13 = load i32, ptr %r12
  %r14 = add i32 0, 3 ; loadint
  %r15 = icmp ne i32 %r13, %r14
  br label %B4

B3:
  %r16 = add i32 0, 0 ; loadint
  br label %B4

B4:
  %r22 = phi i32 [ %r15, %B2 ], [ %r16, %B3 ]
  br i1 %r22, label %B5, label %B6

B5:
  %r18 = add i32 0, 1 ; loadint
  br label %B7

B6:
  %r19 = add i32 0, 0 ; loadint
  br label %B7

B7:
  %r21 = phi i32 [ %r18, %B5 ], [ %r19, %B6 ]
  ret i32 %r21

}
