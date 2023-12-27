int sorted_after = 500;
int a[500];

int state;
int rand()
{
    state = (state * 64013 + 1531011) % 32768;
    return state;
}

int swap(int i, int j)
{
    int tmp = a[i];
    a[i] = a[j];
    a[j] = tmp;
    return 0;
}

int bubblesort(int sorted_after)
{
    int i = 0; // 初始化外层i循环
    while (i < sorted_after)
    {
        int j = i + 1; // 初始化内层j循环
        while (j < sorted_after)
        {
            if (a[i] > a[j])
            {
                swap(i, j); // 使用swap函数交换元素
            }
            j = j + 1; // j循环迭代
        }
        i = i + 1; // i循环迭代
    }
    return 0;
}

int main()
{
    int state = 218397121;
    int i = 0;
    while (i < sorted_after)
    {
        a[i] = rand();
        i = i + 1;
    }

    int sorted_before = 1;
    i = 0; // Resetting i for reuse
    while (i < sorted_after - 1)
    {
        if (a[i] > a[i + 1])
            sorted_before = 0;
        i = i + 1;
    }

    bubblesort(sorted_after);

    int sorted_after = 1;
    i = 0;
    while (i < sorted_after - 1)
    {
        if (a[i] > a[i + 1])
            sorted_after = 0;
        i = i + 1;
    }
    return 200 + sorted_before * 10 + sorted_after;
}
