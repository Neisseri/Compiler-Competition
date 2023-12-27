int foo;

int main()
{

    // for (int i = 0; i < 3; i = i + 1)
    //     foo = foo + 1;
    // 我们不支持这种写法，因为我们不支持for循环
    // 但是我们支持这种写法：
    int i = 0; // 初始化部分，放在while循环外
    while (i < 3)
    {                  // 条件部分作为while的条件
        foo = foo + 1; // 循环体保持不变

        i = i + 1; // 迭代部分，放在循环体的末尾
    }

    return foo;
}