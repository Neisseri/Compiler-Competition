int bar()
{
    int a = 0;
    while(a < 10)
    {
        a=a+1;
        continue;
        break;
    }
    return a;
}

int main() {
    int a= bar();
    return 0;
}