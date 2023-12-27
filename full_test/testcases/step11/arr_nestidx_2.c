int main()
{
    int a[10];
    a[0] = 0;
    // do {
    //     a[0] = a[0] + 1;
    //     a[a[0]] = a[0] + 1;
    // } while (a[0] != 10-1); 我们不支持这种写法，因为我们不支持do-while循环
    // 但是我们支持这种写法：
    while (a[0] != 10 - 1)
    { // 将条件放在循环开始
        a[0] = a[0] + 1;
        a[a[0]] = a[0] + 1;
        if (a[0] == 10 - 1)
        { // 由于原始do-while循环在检查条件之后执行，需要再检查一次以确保退出
            break;
        }
    }
    a[10 - 1] = 0;
    return a[a[a[a[a[a[a[a[a[1]]]]]]]]];
}
