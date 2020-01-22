#!/bin/bash

# UCL module dependencies for Optimet.
# Intended to be sourced.
module purge
module load rcps-core
module load compilers/gnu/4.9.2 mpi/openmpi/3.1.4/gnu-4.9.2 hdf/5-1.10.5/gnu-4.9.2 gsl/1.16/gnu-4.9.2 openblas/0.3.7-serial/gnu-4.9.2 scalapack/2.0.2/gnu-4.9.2/openblas-0.3.7 f2c
