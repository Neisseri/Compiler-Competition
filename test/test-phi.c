int main() {
    int c = 4;
    if (c < 75) {
        int d;
        d = 42;
        if (c < 100) {
            c = c + 42;
            if (c > 99) {
                int e;
                e = 84;
                c = 168;
            }
        }
    }
    return c;
}