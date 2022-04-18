
#include "openmp.h"
#include <stdlib.h>

#define ARRAY_SIZE 1000000


void generate_random_array(double *a, size_t size) {
    for (size_t i=0; i<ARRAY_SIZE; i++) {
        a[i] = rand() / double(RAND_MAX);
    }
}

void main
