#include <math.h>
#include <stdio.h>
#include <sys/time.h>

#define N 100000

double mysecond();

int main() {
  double t1 = mysecond();
  double x = 5.73129874987123;
  for (int i=0; i<N; i++) {
    x = sqrt(x);
  }
  double t2 = mysecond();
  printf("x = sqrt(x) execution time: %f (ns)\t average over %d iterations",
      (t2-t1)/((double)N)*1e9, N);
  return 0;

}

double mysecond() {
  struct timeval tp;
  struct timezone tzp;
  int i;

  i = gettimeofday(&tp, &tzp);
  return ((double)tp.tv_sec + (double)tp.tv_usec * 1.e-6);
}

