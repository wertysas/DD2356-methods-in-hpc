
#include <stdio.h>

#define N 8

int pos_mod(int x, int y);

int main() {
    int i, z, a[N];
    for (i=0; i<N; i++) {
        a[i] = i;
    }
    
    for (i=0; i<=N; i++) {
        z =  pos_mod(i-1, N);
        printf("pos_mod(%d, %d) = %d\n", i-1, N, z);
    }
    
    return 0;
}

int pos_mod(int x, int y) {
    return (y + x%y) % y;
}

