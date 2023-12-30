//gcc dead-code-elimination.c sylib.c -include sylib.h -Wall -Wno-unused-result -Wno-unused-variable -o binary-dead-code-elimination && time ./binary-dead-code-elimination < dead-code-elimination.in
int loopCount = 0;
int global = 0;

void func(int i0)
{
  int i1 = 1;
  int i2 = 2;
  int i3 = 3;
  int i4 = 4;
  int i5 = 5;
  int i6 = 6;
  int i7 = 7;
  int i8 = 8;
  int i9 = 9;
  global = i0;
  int i10 = 10;
  int i11 = 11;
  int i12 = 12;
  int i13 = 13;
  int i14 = 14;
  int i15 = 15;
  int i16 = 16;
  int i17 = 17;
  int i18 = 18;
  int i19 = 19;
  int i20 = 20;
  return;
}

int main()
{
    func(100);
    return 0;
}
