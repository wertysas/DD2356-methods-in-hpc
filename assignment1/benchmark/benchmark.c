#define N 10000
#include <stdio.h>
#include <sys/time.h>

double mysecond();

int main() {
  int i, j;
  double t1, t2;           // timers
  double a[N], b[N], c[N]; // arrays

  // init arrays
  for (i = 0; i < N; i++) {
    a[i] = 47.0;
    b[i] = 3.1415;
  }

  // Cache heating
  for (i = 0; i < N; i++) {
    c[i] = a[i] * b[i];
  } // might be optimised away see ASM output

  // measure performance
  int ITERATIONS = 100;
  t1 = mysecond();
  for (j = 0; j < ITERATIONS; j++)
    for (i = 0; i < N; i++) {
      c[i] = a[i] * b[i];
    }
  t2 = mysecond();

  printf("Execution time: %11.8f s (average over %d iterations)\n",
         (t2 - t1) / ((float)ITERATIONS), ITERATIONS);

  // Usage of array C in order to prevent compiler from optimizing it away
  double funnysum = 0.0;
  for (i = 0; i < N; i++) {
    if (funnysum < 10000.0) {
      funnysum += c[i];
    } else {
      funnysum = 0.0;
    }
  }
  printf("funnysum = %f \n", funnysum);
  return 0;
}

// function with timer
double mysecond() {
  struct timeval tp;
  struct timezone tzp;
  int i;

  i = gettimeofday(&tp, &tzp);
  return ((double)tp.tv_sec + (double)tp.tv_usec * 1.e-6);
}
