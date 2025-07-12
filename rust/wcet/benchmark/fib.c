unsigned int fib( int );
int main ( void );

unsigned int fib (unsigned int n) {
    unsigned int sum = 0;
    unsigned int last = 0;
    unsigned int curr = 1;

    if(n == 1) return 1;
    _Pragma( "loopbound min 2 max 47" )
    for(unsigned int i = 2; i < n; i++) {
        sum = last + curr;
        last = curr;
        curr = sum;
    }
    return sum;
}

unsigned int eval(unsigned int actual, unsigned int expected) {
    if (expected - actual == 0) return 1;
    else return 0;
}

int main() {
    if(!eval(fib(48), 2971215073)) return 1;
    else return 0;
}