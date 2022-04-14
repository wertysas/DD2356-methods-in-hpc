
#include <time.h>

#define N 100 // the number of measurements

struct timespec t0, t1;

double tdiff[N];

int main() {
for (int i=0; i<N; i++) {
    clock_gettime(CLOCK_MONOTONIC, &t0);
    // code/fn to be measured
    clock_gettime(CLOCK_MONOTONIC, &t1);

    tdiff[i] = (t1.tv_sec-t0.tv_sec) + 1e-9*(t1.tv_nsec-t0.tv_nsec);
    }

}

