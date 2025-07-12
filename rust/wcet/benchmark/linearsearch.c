int randomInteger( void );
void init( void );
int linear_search( int );
int main( void );

volatile int seed;
int data [15];

int randomInteger( void )
{
    seed = ( ( seed * 133 ) + 81 ) % 8095;
    return ( seed );
}

void init( void )
{
    int i;
    seed = 0;
    _Pragma( "loopbound min 15 max 15" )
    for ( i = 0; i < 15; ++i ) {
        data[ i ] = randomInteger();
    }
}

int linear_search( int x ) {
    int result = -1;
    int i;
    _Pragma( "loopbound min 1 max 15" )
    for ( i = 0; i < *(&data + 1) - data; i++) {
        if(data[ i ] == x) result = 1;
    }
    return result;
}

int main() {
    init();
    int result = linear_search(7640);
    if( result == 1 ) return 0;
    else return 1;
}
