int a[2];
int main() {
    // a[0]=a[1]=5;我们不支持这种写法
    a[0]=5;
    a[1]=5;
    return a[1]*a[0];
}
