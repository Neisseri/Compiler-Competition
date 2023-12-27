int a;

int fun() {

    //return a=5; // this is not allowed
    a = 5;
    return 0 ;
}

int main() {
    int b = a;
    fun();
    return a + b;
}