int fun()
{
  int array[100] = {100};
  return array[10] + array[0];
}

int main()
{
  int b[10] = {3, 4, 5};
  int ans = fun();
  int i = 0; // Initialization outside the loop
  while (i < 10)
  {                   // Condition remains the same
    ans = ans + b[i]; // Body of the loop remains the same
    i = i + 1;        // Increment at the end of the loop body
  }

  return ans;
}