void hanoi(int n, int two, int three)
{
    if (n == 1)
        putint(three);
    else {
        hanoi(n - 1, three, two);
    }
}

int main()
{
    hanoi(2, 2, 3);
    return 0;
}
