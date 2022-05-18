
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
     
    if (rank == 0) {
        count += local_count;
        int local_counts[size-1];
        for (int i=0; i<size-1; i++) {
            MPI_Recv(&local_counts[i], 1, MPI_INT, i+1, 0, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
            count+= local_counts[i];
        }
        pi = ((double)count / (double)NUM_ITER) * 4.0;
    } else {
        MPI_Send(&local_count, 1, MPI_INT, 0, 0, MPI_COMM_WORLD);
    }
    
    t1 = MPI_Wtime();
    elapsed_time = t1 - t0;
    
    if (rank == 0) {
        //printf("PI: %f\n", pi);
        //printf("Execution Time: %f\n", elapsed_time);
        printf("%d\t%f\n", size, elapsed_time);
    }

    MPI_Finalize();
    return 0;
}

