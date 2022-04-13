
#include <stdio.h>
#include "omp.h"

int main()
{
#pragma omp parallel
  {
    int ID = omp_get_thread_num();
    printf("Hello world this is thread %d!\n", ID);
  } // END OF PARALLEL REGION
  return 0;
}

