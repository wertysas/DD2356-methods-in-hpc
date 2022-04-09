#define N 1000000
#include <stdio.h>
#include <sys/time.h>

double mysecond();

int main(){
  int i, j;
  double t1, t2; // timers                                                         
  double a[N], b[N], c[N]; // arrays  
                                             
  // init arrays                                                                   
  for (i = 0; i < N; i++){
    a[i] = 47.0;
    b[i] = 3.1415;
  }

  // measure performance                                                           
  t1 = mysecond();
  for(i = 0; i < N; i++)
    c[i] = a[i]*b[i];
  t2 = mysecond();

  printf("Execution time: %11.8f s\n", (t2 - t1));


  // Usage of array C in order to prevent compiler from optimizing it away
  double funnysum = 0.0;
  for (i=0; i<N; i++) {
    if (funnysum < -1e-6 | funnysum > 1e-6) {
      funnysum += c[i];
    }
    else { funnysum = 0.0;}
  } 
  printf("funnysum = %f \n", funnysum);
  return 0;
}



// function with timer                                                             
double mysecond(){
  struct timeval tp;
  struct timezone tzp;
  int i;

  i = gettimeofday(&tp,&tzp);
  return ( (double) tp.tv_sec + (double) tp.tv_usec * 1.e-6 );
}

