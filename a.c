int foo(int a, int b){
  return a + b;
}

int goo(int a, int b, int c, int d, int e, int f, int g, int h, int i, int j, int k, int l, int m, int n){
  return foo(g, f);
}

int main(){
  int a = 1;
  int b = 2;
  int c = 2;
  int d = 4;
  int e = 5;
  int f = 6;
  int g = 8;
  d = goo(a, b, b, c, d, e, g, f, g, f, c, d, c, e);
  return d;
}