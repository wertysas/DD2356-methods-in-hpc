
#include <stdio.h>
#include "omp.h"

int main()
{
#pragma omp parallel
  {
    int ID = omp_get_thread_num();
    printf("Hello world this is thread %d!\n", ID);
  } // end of parallel region
  return 0;
}

