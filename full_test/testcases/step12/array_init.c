int main()
{
  int b[10] = {3, 4, 5};
  int ans = 0;
  int i = 0; // 初始化变量i
  while (i < 10)
  {                   // 循环条件
    ans = ans + b[i]; // 循环体保持不变

    i = i + 1; // 迭代步骤
  }

  return ans;
}