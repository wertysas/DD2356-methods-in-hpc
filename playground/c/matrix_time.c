
#include <stdlib.h>
#include <stdio.h>
#include <time.h>

#define n 1024

double A[n][n], B[n][n], C[n][n];

typedef unsigned int uint;

void matrix_matrix_mul(double** A, double** B, double** C) {
  for (uint i=0; i<n; i++) {
    for (uint j=0; j<n; j++) {
      for (uint k=0; k<n; k++) {
         C[i][j] += A[i][k] * B[k][j];
      }
    }
  }  
}
