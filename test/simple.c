int bar(int b,int c)
{
    int a = 0;
    while(a < 10)
    {
        a=a+1;
        continue;
        break;
    }
    return 1;
}

int main() {
    int c = bar(1, 2);
    return c;
}