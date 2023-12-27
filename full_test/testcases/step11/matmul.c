int a[2][2];
int b[2][2];

int mulMatrix(int n)
{
    int i;
    int j;
    int k;
    i = 0;
    while (i < n)
    {
        j = 0;
        while (j < n)
        {
            b[i][j] = 0;
            k = 0;
            while (k < n)
            {
                b[i][j] = b[i][j] + a[i][k] * a[k][j];
                k = k + 1;
            }
            j = j + 1;
        }
        i = i + 1;
    }
    return 0;
}

int initMatrix(int n)
{
    int i;
    int j;
    int k;
    k = 0;
    i = 0;
    while (i < 2)
    {
        j = 0;
        while (j < 2)
        {
            k = k + 1;
            a[i][j] = k;
            j = j + 1;
        }
        i = i + 1;
    }
    return 0;
}

int main()
{
    initMatrix(2);
    mulMatrix(2);
    int i = 0; // 初始化外层i循环
    while (i < 2)
    {
        int j = 0; // 初始化内层j循环
        while (j < 2)
        {
            a[i][j] = b[i][j]; // 将b[i][j]的值赋给a[i][j]
            b[i][j] = 0;       // 将b[i][j]设置为0

            j = j + 1; // j循环迭代
        }
        i = i + 1; // i循环迭代
    }

    mulMatrix(2);
    if (b[0][0] != 199)
        return 1;
    if (b[0][1] != 290)
        return 2;
    if (b[1][0] != 435)
        return 3;
    if (b[1][1] != 634)
        return 4;
    return 0;
}
