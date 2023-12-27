int fun(int a[][5])
{
    return a[0][3];
}

int func(int a[])
{
    return a[2];
}

int func2(int a)
{
    return a;
}

int main()
{
    int a[5];
    int c[5][5];
    c[0][3] = 2;
    int b = 3;
    a[2] = func2(b);
    int d = fun(c);
    int e = b + d;
    return func(a);
}