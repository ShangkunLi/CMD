#include <stdio.h>
#define N 4

// Simple loop with an array
int kernel() {
    int i;
    volatile int a[N] = {1,2,3,4};
    volatile int b[N] = {5,6,7,8};
    volatile int c[N] = {0};
    
    for (i = 0; i < N; i++) {
        c[i] = a[i] + b[i];
    }

    int sum = 0;
    for (i = 0; i < N; i++) {
        sum += c[i];
    }

    return sum;
}
