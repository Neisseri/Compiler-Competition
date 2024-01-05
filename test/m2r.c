int array[1];
int n;
void init(int n) {
}

int main() {
  int t = 1;
  int a, b;
  while (t) {
    t = t - 1;
    n = 1;
    int i = 0;
    int flag = 0;
    init(n);
    int k = 17;

    while (i < 10) {
      a = 1;
      b = 2;

      if (!flag) {
        int loc = n * (a - 1) + b;
        if (array[0] != -1 && array[k] != -1 && 0 == k) {
          flag = 1;
          int tmp = i + 1;
        }
      }

      i = i + 1;
    }
    if (!flag) {
      putint(-1);
    }
  }
  return 0;
}
