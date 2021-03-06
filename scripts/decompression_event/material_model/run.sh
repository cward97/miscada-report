#!/bin/bash

#############################################################################

#SBATCH  -n  12 
#SBATCH  -p  par6.q

#############################################################################

module purge
module load use.own aspect/release
module load gsl/gcc/64/1.15 # required to avoid dynamic library error

DATA_DIR=../../../var/decompression_event/material_model

mkdir -p $DATA_DIR
rm -f -r $DATA_DIR

# Execute.
mpirun -np 12 ./aspect input.prm

mv output $DATA_DIR
