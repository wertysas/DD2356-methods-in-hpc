#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h> /* For memset */
#include <sys/time.h>

#define G 6.673e-11
#define DIM 2
#define N 2000 // number of particles
#define delta_t 0.5
#define iterations 100

typedef double vect_t[DIM];
typedef unsigned int uint;

// n-body solver declarations
void update_forces(vect_t *forces, vect_t *positions, double *masses);
void update_forces_simple(vect_t *forces, vect_t *positions, double *masses);
void move_positions(vect_t *forces, vect_t *positions, vect_t *velocities,
                    double *masses);
void n_body_solver_simple(vect_t *forces, vect_t *positions, vect_t *velocities,
                          double *masses);
void n_body_solver(vect_t *forces, vect_t *positions, vect_t *velocities,
                   double *masses);
// timing declarator
double mysecond();

int main() {

  vect_t *forces = malloc(N * sizeof(vect_t));
  vect_t *positions = malloc(N * sizeof(vect_t));
  vect_t *velocities = malloc(N * sizeof(vect_t));
  double *masses = malloc(N * sizeof(double));

  // Initialization of particles
  for (uint i = 0; i < N; i++) {
    positions[i][0] = (rand() / (double)(RAND_MAX)) * 2 - 1;
    positions[i][1] = (rand() / (double)(RAND_MAX)) * 2 - 1;

    velocities[i][0] = (rand() / (double)(RAND_MAX)) * 2 - 1;
    velocities[i][1] = (rand() / (double)(RAND_MAX)) * 2 - 1;

    masses[i] = fabs((rand() / (double)(RAND_MAX)) * 2 - 1);
  }
  
  //  MEASUREMENT CODE
  int ITERATIONS = 100;
  double timings[ITERATIONS];
  double t0;
  n_body_solver(forces, positions, velocities, masses); // cache heating run
  for (int j = 0; j < ITERATIONS; j++) {
    t0 = mysecond();
    //n_body_solver(forces, positions, velocities, masses);
    n_body_solver_simple(forces, positions, velocities, masses);
    timings[j] = mysecond() - t0;
  }
  
  // Stats
  double mean=0, variance=0;
  for (int i=0; i<ITERATIONS; i++) {
    mean += timings[i];
  }
  mean /= (double)ITERATIONS;
  for (int i=0; i<ITERATIONS; i++) {
    variance += (timings[i]-mean) * (timings[i]-mean);
  }
  variance /= (double)ITERATIONS;

  printf("----------nbody solver measurement----------\n");
  printf("number of particles: %d \t delta_t: %f \t iterations: %d \n", N,
         delta_t, iterations);
  printf("execution time: %11.8f s (average over %d measurements) \n", mean , ITERATIONS);
  printf("measurement variance: %11.8f \n", variance);

  return 0;
}

void n_body_solver_simple(vect_t *forces, vect_t *positions, vect_t *velocities,
                          double *masses) {
  for (uint i = 0; i < iterations; i++) {
    update_forces_simple(forces, positions, masses);
    move_positions(forces, positions, velocities, masses);
  }
}

void n_body_solver(vect_t *forces, vect_t *positions, vect_t *velocities,
                   double *masses) {
  for (uint i = 0; i < iterations; i++) {
    update_forces(forces, positions, masses);
    move_positions(forces, positions, velocities, masses);
  }
}

void update_forces_simple(vect_t *forces, vect_t *positions, double *masses) {
  for (uint i = 0; i < N; i++) {
    for (uint j = 0; j != i && j < N; j++) {
      double x_diff, y_diff, dist, dist_cubed;
      x_diff = positions[i][0] - positions[j][0];
      y_diff = positions[i][1] - positions[j][1];
      dist = sqrt(x_diff * x_diff + y_diff * y_diff);
      dist_cubed = dist * dist * dist;
      forces[i][0] -= G * masses[i] * masses[j] / dist_cubed * x_diff;
      forces[i][1] -= G * masses[i] * masses[j] / dist_cubed * y_diff;
    }
  }
}

void update_forces(vect_t *forces, vect_t *positions, double *masses) {
  forces = memset(forces, 0, N * sizeof(vect_t)); // set all forces to 0
  for (uint i = 0; i < N; i++) {
    for (uint j = i + 1; j < N; j++) {
      double xdiff, ydiff, dist, dist_cubed;
      double force_ij[2];
      xdiff = positions[i][0] - positions[j][0];
      ydiff = positions[i][1] - positions[j][1];
      dist = sqrt(xdiff * xdiff + ydiff * ydiff);
      dist_cubed = dist * dist * dist;
      force_ij[0] = G * masses[i] * masses[j] / dist_cubed * xdiff;
      force_ij[1] = G * masses[i] * masses[j] / dist_cubed * ydiff;
      forces[i][0] += force_ij[0];
      forces[i][1] += force_ij[1];
      forces[j][0] -= force_ij[0];
      forces[j][1] -= force_ij[1];
    }
  }
}

void move_positions(vect_t *forces, vect_t *positions, vect_t *velocities,
                    double *masses) {
  for (uint i = 0; i < N; i++) {
    positions[i][0] += delta_t * velocities[i][0];
    positions[i][1] += delta_t * velocities[i][1];
    velocities[i][0] += delta_t / masses[i] * forces[i][0];
    velocities[i][1] += delta_t / masses[i] * forces[i][1];
  }
}

// function with timer
double mysecond() {
  struct timeval tp;
  struct timezone tzp;
  int i;

  i = gettimeofday(&tp, &tzp);
  return ((double)tp.tv_sec + (double)tp.tv_usec * 1.e-6);
}
