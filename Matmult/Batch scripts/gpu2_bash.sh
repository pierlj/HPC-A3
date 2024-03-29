#!/bin/bash
#BSUB -q hpcintrogpu
#BSUB -o gpu2_32_output.dat
#BSUB -J gpu2_32
#BSUB -n 12
#BSUB -gpu "num=1:mode=exclusive_process:mps=yes" 
module load cuda/10.0
numactl --cpunodebind=0

for mat_size in 500 1000 1500 2000 2500 3000 4000 5000 6000 8000 10000
do
	./matmult_f.nvcc gpu2 $mat_size $mat_size $mat_size
done
