#!/bin/bash

cc -O2 -fopenmp -o hello.out helloworld_omp.c
./hello.out > hello_output
