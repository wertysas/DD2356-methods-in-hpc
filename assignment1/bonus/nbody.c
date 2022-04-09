
#include <math.h>
#include <stdlib.h>
#include <string.h> /* For memset */

#define G 6.673e-11
#define DIM 2
#define N 500 //number of particles
#define delta_t 0.5
#define iterations 100

typedef double vect_t[DIM];
typedef unsigned int uint;

void update_forces(vect_t *forces, vect_t *positions, double *masses);
void update_forces_simple(vect_t *forces, vect_t *positions, double *masses);
void move_positions(vect_t *forces, vect_t *positions, vect_t *velocities, double *masses);
void n_body_solver_simple(vect_t *forces, vect_t *positions, vect_t *velocities, double *masses);
void n_body_solver(vect_t *forces, vect_t *positions, vect_t *velocities, double *masses);

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

  return 0;
}

void n_body_solver_simple(vect_t *forces, vect_t *positions, vect_t *velocities, double *masses) {
  for (uint i = 0; i<iterations; i++) {
    update_forces_simple(forces,positions, masses);
    move_positions(forces, positions, velocities, masses);
  }
  }

void n_body_solver(vect_t *forces, vect_t *positions, vect_t *velocities, double *masses) {
  for (uint i=0; i<iterations; i++) {
    update_forces(forces,positions, masses);
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
      forces[i][0] -= G *masses[i] * masses[j] / dist_cubed *x_diff;
      forces[i][1] -= G *masses[i] * masses[j] / dist_cubed *y_diff;
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
