/*
 * Serial array sum time measurement code
*/

#include<stdio.h>
#include <sys/time.h>
#include <stdlib.h>
#include "omp.h"
#include <math.h>

#define ARRAY_SIZE 100000000
#define ITERATIONS 10
#define WARMUP_ITERATIONS 2
#define MAX_THREADS 32
#define CBLK_DOUBLE 8


void initialise_random(double *x, size_t size);
double omp_local_sum_padded(double *x, size_t size);
double min(double* x, unsigned int n);
double max(double* x, unsigned int n);
double mean(double* x, unsigned int n);
double sample_var(double* x, unsigned int n);

int main() {
    printf("--------------------------------------------------------------------------------\n");
    printf("ARRAY SIZE: %d\tITERATIONS: %d\n", ARRAY_SIZE, ITERATIONS);
    printf("Clock measurements: milliseconds\n");
   
    // Initialisation of arrays
    double tdiffs[ITERATIONS+WARMUP_ITERATIONS];
    double *x;
    x = (double*)malloc(ARRAY_SIZE*sizeof(double));
    initialise_random(x, ARRAY_SIZE);
    
    double mint, maxt, meant, vart;
    double t0, t1;
    double tmp, res=0.0;
    
    int sizes[10] ={1, 2, 4, 8, 12, 16, 20, 24, 28, 32};
    printf("--------------------------------------------------------------------------------\n");
    
    for (int k = 0; k<10; k++)
    {
    int num_threads = sizes[k];
    omp_set_num_threads(num_threads);
    printf("THREADS:\t %d \n", num_threads);
    res =0.0;

    for (int i=0; i<ITERATIONS+WARMUP_ITERATIONS; i++) {
        t0 = omp_get_wtime();
        tmp = omp_local_sum_padded(x, ARRAY_SIZE);
        t1 = omp_get_wtime();
        tdiffs[i] = (t1-t0)*1e3;
        // computation to make sure tmp is calculated
        res += tmp;
    }
    mint = min(tdiffs+WARMUP_ITERATIONS, ITERATIONS);
    maxt = max(tdiffs+WARMUP_ITERATIONS, ITERATIONS);
    meant = mean(tdiffs+WARMUP_ITERATIONS, ITERATIONS);
    vart = sample_var(tdiffs+WARMUP_ITERATIONS, ITERATIONS);
    
    printf("result: %f\n", res/(double)ARRAY_SIZE);
    printf("min: %f \nmax: %f \nmean: %f \nstd deviation: %f \n", mint, maxt, meant, sqrt(vart));
    printf("================================================================================\n");
    }
}


void initialise_random(double *x, size_t size) {
    for (size_t i=0; i<size; i++) {
    x[i] = rand() / (double)(RAND_MAX);
    }
}

double omp_local_sum_padded(double *x, size_t size) {
    double localsum[MAX_THREADS][CBLK_DOUBLE]={0.0}; // L1 cacheline padding (64b)
    
    #pragma omp parallel shared(localsum)
    {
        int id = omp_get_thread_num();
        #pragma omp for
        for (size_t i=0; i<size; i++) {
            localsum[id][0] +=x[i];
        }
    } // end of parallel region
    
    double sum = 0.0;
    for (int i=0; i<MAX_THREADS; i++) {
        sum += localsum[i][0];
    }
    return sum;
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



