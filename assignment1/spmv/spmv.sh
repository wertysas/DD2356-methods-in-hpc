#!/bin/bash
# script running the benchmark with different matrix sizes
for size in 10 100 1000 10000 # n = sqrt(nrows) in spmv.c
do
    ./spmv.out $size
done

