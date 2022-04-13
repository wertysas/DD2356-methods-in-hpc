#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>
#include <stdint.h>
#include <unistd.h>


#define RDTSC_START()            \
	__asm__ volatile("CPUID\n\t" \
	                 "RDTSC\n\t" \
	                 "mov %%edx, %0\n\t" \
	                 "mov %%eax, %1\n\t" \
	                 : "=r" (start_hi), "=r" (start_lo) \
	                 :: "%rax", "%rbx", "%rcx", "%rdx");

#define RDTSC_STOP()              \
	__asm__ volatile("RDTSCP\n\t" \
	                 "mov %%edx, %0\n\t" \
	                 "mov %%eax, %1\n\t" \
	                 "CPUID\n\t" \
	                 : "=r" (end_hi), "=r" (end_lo) \
	                 :: "%rax", "%rbx", "%rcx", "%rdx");

uint64_t elapsed(uint32_t start_hi, uint32_t start_lo,
                 uint32_t end_hi,   uint32_t end_lo)
{
	uint64_t start = (((uint64_t)start_hi) << 32) | start_lo;
	uint64_t end   = (((uint64_t)end_hi)   << 32) | end_lo;
	return end-start;
}

int main(int argc, char *argv[])
{
  uint64_t *ticks;
  int    i, n, maxn;
  uint32_t start_hi=0, start_lo=0; 
  uint32_t   end_hi=0,   end_lo=0;
  
  if (argc > 0) n = atoi(argv[1]);
  
  ticks = (uint64_t *)malloc(n * sizeof(uint64_t));
  uint64_t totalTime = 0;
  for (i=0; i<n; i++) {
    RDTSC_START()
      // WE MEASURE NOTHING!
    RDTSC_STOP()
    uint64_t e = elapsed(start_hi, start_lo, end_hi, end_lo);
    ticks[i] = e;
    totalTime += e;
  }
  printf("average: %f (clock cycles) over %d iterations\n", totalTime/(float)n, n); 

  return 0;
}

