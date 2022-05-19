
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <math.h>
#include <time.h>
#include "mpi.h"
#include <limits.h>

#define SEED     921
#define NUM_ITER 1000000000


typedef unsigned int uint;

int log2ceil(int n);


int main(int argc, char* argv[])
{
    int count = 0, rank, size, provided;
    double x, y, z, pi;
   
    MPI_Init_thread(&argc, &argv, MPI_THREAD_SINGLE, &provided);

    double t0, t1, elapsed_time;
    t0 = MPI_Wtime();

    MPI_Comm_size(MPI_COMM_WORLD, &size);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);


    srand(SEED*rank); // Different seeds for each process
    int n_iter = NUM_ITER/size;
    int local_count = 0;
    int received_count = 0;
    // Calculate PI following a Monte Carlo method
    //printf("starting to calculate PI from process rank %d\n", rank);
    for (int iter = 0; iter < n_iter; iter++)
    {
        // Generate random (X,Y) points
        x = (double)random() / (double)RAND_MAX;
        y = (double)random() / (double)RAND_MAX;
        //z = sqrt((x*x) + (y*y)); NOTE that we dont have to sqrt since sqrt(1)=1
        z = x*x + y*y;
        // Check if point is in unit circle
        if (z <= 1.0)
        {
            local_count++;
        }
    }
    
    // Reduction step we assume that size 2^h for some integer h,
    // 
    int h = log2ceil(size), step_size = 1, multiplier=2, n_sends; 
    for (int i=h-1; i>=0; i--) {
        n_sends = 1 << i; // number of messages to send/receive 2^(h-1), 2^(h-2), ...
        for (int j=0;j<n_sends;j++) {
            if (rank==(j*multiplier+step_size)) {
                MPI_Send(&local_count, 1, MPI_INT, j*multiplier, 0, MPI_COMM_WORLD);
            }
            if (rank==j*multiplier) { // Receiving
                MPI_Recv(&received_count, 1, MPI_INT, j*multiplier+step_size, 0, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
                local_count +=  received_count;
            }
        }
        step_size *= 2;
        multiplier *= 2;
    }



    if (rank == 0) {
        count = local_count;
        pi = ((double)count / (double)NUM_ITER) * 4.0;
    } 
    t1 = MPI_Wtime();
    elapsed_time = t1 - t0;
    
    if (rank == 0) {
        printf("PI: %f\n", pi);
        //printf("Execution Time: %f\n", elapsed_time);
        printf("%d\t%f\n", size, elapsed_time);
    }

    MPI_Finalize();
    return 0;
}

// Returns ceil(log2(n)) of a nonnegative integer
int log2ceil(int n) {
    uint x = (uint) n-1;
    int lg = 0;
    while (x!=0) {
        x = x >> 1;
        lg++;
    }
    return lg;
}

