#!/bin/csh

#############################################################################

#SBATCH  -n  12 
#SBATCH  -p  par7.q

#############################################################################

module purge
module load use.own aspect/release
module load gsl/gcc/64/1.15 # required to avoid dynamic library error

# Avoid cold start effects.
./aspect in/2pp1.prm > /dev/null

set n = 1
while ($n <= 12)
  mpirun -np $n ./aspect in/2pp$n.prm | tee out/2pp$n.txt
  @ n++
end

# Clean up.
rm -r output-box_2pp
