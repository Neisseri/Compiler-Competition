#include <iostream>

// attempt to fool the inliner
int param32_rec(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8,
                int a9, int a10, int a11, int a12, int a13, int a14, int a15,
                int a16, int a17, int a18, int a19, int a20, int a21, int a22,
                int a23, int a24, int a25, int a26, int a27, int a28, int a29,
                int a30, int a31, int a32) {
  if (a1 == 0) {
    return a2;
  }
  else {
    return param32_rec(a1 - 1, (a2 + 1) % 998244353, a4, a5, a6, a7, a8, a9,
                       a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20,
                       a21, a22, a23, a24, a25, a26, a27, a28, a29, a30, a31,
                       a32, 0);
  }
}


int main() {
  std::cout << param32_rec(95, 91, 81, 80, 67, 63, 63, 58, 55, 54, 45, 19, 17, 13, 13, 5, 17, 13, 80, 55, 81, 91, 95,
                              58, 13, 5, 63, 19, 54, 45,
                              67, 63);
  return 0;
}
