volatile int out;

__attribute__((noinline)) void f(int x) {
    int i;
    for(i = 0; i<1024;i++) out+=x;
}
int main() {
    f(3);
    f(5);
    return 0;
}
