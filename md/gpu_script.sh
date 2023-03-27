#!/bin/bash
#SBATCH --account=chm6586
#SBATCH --qos=chm6586
#SBATCH --job-name=boce_min
#SBATCH --output=min.out
#SBATCH --error=min.err
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --distribution=block:block
#SBATCH --time=7-00:00:00
#SBATCH --mem-per-cpu=10gb
#SBATCH --mail-type=ALL
#SBATCH --mail-user=le.chen@ufl.edu
#SBATCH --partition=gpu
#SBATCH --gres=gpu:a100:1

cd $SLURM_SUBMIT_DIR

export OMP_NUM_THREADS=1



module load  cuda/11.1.0 nvhpc/20.11 openmpi/4.0.5 amber/20

srun --mpi=pmix_v2 -n 1 sander.MPI -O -i  min1.in -o min1.out -p ../003_Leap_Boce/mpro.wet.complex.parm7  -c ../003_Leap_Boce/mpro.wet.complex.rst7 -r min1.rst -inf min1.mdinfo -ref ../003_Leap_Boce/mpro.wet.complex.rst7
srun --mpi=pmix_v2 -n 1 sander.MPI -O -i  min2.in -o min2.out -p ../003_Leap_Boce/mpro.wet.complex.parm7  -c min1.rst -r min2.rst -inf min2.mdinfo -ref min1.rst
srun --mpi=pmix_v2 -n 1 sander.MPI -O -i  min3.in -o min3.out -p ../003_Leap_Boce/mpro.wet.complex.parm7  -c min2.rst -r min3.rst -inf min3.mdinfo -ref min2.rst
srun --mpi=pmix_v2 -n 1 sander.MPI -O -i  min4.in -o min4.out -p ../003_Leap_Boce/mpro.wet.complex.parm7  -c min3.rst -r min4.rst -inf min4.mdinfo -ref min3.rst
srun --mpi=pmix_v2 -n 1 sander.MPI -O -i  min5.in -o min5.out -p ../003_Leap_Boce/mpro.wet.complex.parm7  -c min4.rst -r min5.rst -inf min5.mdinfo -ref min4.rst
snlsldsfd	 --mpi=pmix_v2 -n 1 sander.MPI -O -i  min6.in -o min6.out -p ../003_Leap_Boce/mpro.wet.complex.parm7  -c min5.rst -r min6.rst -inf min6.mdinfo
