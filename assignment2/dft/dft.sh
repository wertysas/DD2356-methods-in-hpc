#!/bin/bash

# clear the output file
echo -n "" > dft_omp.txt

# prints the bandwidth of the output
sizes=( 1 2 4 8 12 16 20 24 28 32 )
for i in "${sizes[@]}"
do  
    export OMP_NUM_THREADS="$i"
    s="$i" 
    #echo $i
    for k in {1..10}
    do
        # ./stream.out > stream_omp.txt
        # awk '$1 ~ /Number/' stream_omp.txt
        # awk '$1 ~ /Copy/ {print $2}' stream_omp.txt #filter by 1st column including copy print 2nd column
        s+=$", "
        s+=$(./dft_omp | awk '$2 ~ /computation/ {print $4}') #filter by 1st column including copy print 2nd column
    done
    echo $s >> dft_omp.txt
done
