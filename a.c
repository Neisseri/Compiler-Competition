
int func9params(int a, int b, int c, int d, int e, int f, int g, int h, int k) {
  return a+b+c+d+e+f+g+h+k;
}

int main() {
  int d = func9params(1,2,3,4,5,6,7,8,9) + func9params(1,2,3,4,5,6,7,8,100);
  return d;
}