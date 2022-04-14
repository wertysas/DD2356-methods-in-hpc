/*
 * Serial array sum time measurement code
*/

#include<stdio.h>
#include <sys/time.h>
#include <stdlib.h>


#define ARRAY_SIZE 1000000
#define ITERATIONS 1000

void initialise_random(double *x, size_t size);
double serial_sum(double *x, size_t size);
double mysecond();
double min(double* x, unsigned int n);
double max(double* x, unsigned int n);
double mean(double* x, unsigned int n);
double sample_var(double* x, unsigned int n);

int main() {
    printf("--------------------------------------------------------------------------------\n");
    printf("ARRAY SIZE: %d\tITERATIONS: %d\n", ARRAY_SIZE, ITERATIONS);
    printf("Clock measurements: microseconds\n");
    
    double tdiffs[ITERATIONS];
    double x[ARRAY_SIZE];
    initialise_random(x, ARRAY_SIZE);
    
    double mint, maxt, meant, vart;
    double t0;
    double tmp, res=0.0;
    
    for (int i=0; i<ITERATIONS; i++) {
        t0 = mysecond();
        tmp = serial_sum(x, ARRAY_SIZE);
        tdiffs[i] = mysecond()-t0;
        printf("measured time: %f\n", tdiffs[i]);
    }
    mint = min(x, ARRAY_SIZE);
    maxt = max(x, ARRAY_SIZE);
    meant = min(x, ARRAY_SIZE);
    vart = min(x, ARRAY_SIZE);
    
    printf("result: %f\n", res);
    printf("min: %f \nmax: %f \nmean: %f \nvariance:%f \n", mint, maxt, meant, vart);
    printf("--------------------------------------------------------------------------------\n");

}


void initialise_random(double *x, size_t size) {
    for (size_t i=0; i<size; i++) {
    x[i] = rand() / (double)(RAND_MAX);
    }
}

double serial_sum(double *x, size_t size) {
    double sum = 0.0;
    for (size_t i=0; i<size; i++) {
        sum += x[i];
    }
    return sum;
}

double mysecond() {
  struct timeval tp;
  struct timezone tzp;
  int i;

  i = gettimeofday(&tp, &tzp);
  return ((double)tp.tv_sec + (double)tp.tv_usec * 1.e-6);
}

double min(double* x, unsigned int n) {
    double min = x[0];
    for (unsigned int i=1; i<n; i++) {
        if (x[i] < min) min = x[i]; }
    return min;
}

double max(double* x, unsigned int n) {
    double max = x[0];
    for (unsigned int i=1; i<n; i++) {
        if (x[i] > max) max = x[i];
    }
    return max;
}

double mean(double* x, unsigned int n) {
    double mean = 0.0;
    for (unsigned int i=0; i<n; i++) {
        mean += x[i];
    }
    return mean/(double)n;
}

double sample_var(double* x, unsigned int n) {
    double mean = 0.0;
    for (unsigned int i=0; i<n; i++) {
        mean += x[i];
    }
    mean /= (double)n;
    double var = 0.0;
    for (unsigned int i=0; i<n; i++) {
        double diff = x[i] - mean;
        var += diff*diff;
    }
    return var/(double)(n-1); // Call this with n=0 or 1 for best results!
}



