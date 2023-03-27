#!/bin/bash
#SBATCH --account=colina
#SBATCH --qos=colina
#SBATCH --job-name=mmgbsa
#SBATCH --output=mmgbsa.out
#SBATCH --error=mmgbsa.err
#SBATCH --nodes=2
#SBATCH --ntasks=2
#SBATCH --cpus-per-task=1
#SBATCH --distribution=block:block
#SBATCH --time=7-00:00:00
#SBATCH --mem-per-cpu=10gb
#SBATCH --mail-type=ALL
#SBATCH --mail-user=le.chen@ufl.edu
#SBATCH --partition=gpu
#SBATCH --gres=gpu:a100:1

#cd $SLURM_SUBMIT_DIR

#export OMP_NUM_THREADS=2
module load cuda/10.0.130/ intel/2017.4.056/ openmpi/3.1.2 amber/18
#module load gcc cuda amber/20

solv_parm="../003_Leap/mpro.wet.complex.parm7"
complex_parm="../003_Leap/mpro.complex.parm7"
receptor_parm="../003_Leap/mpro.gas.receptor.parm7"
lig_parm="../003_Leap/mpro.gas.ligand.parm7"
trajectory="../WetComplex_20A/md.nc"

mpirun -np 2 $AMBERHOME/bin/MMPBSA.py -O -i mmgbsa.in \
	-o bro_mmgbsa_results.dat \
	-eo bro_mmgbsa_perframe.dat \
	-sp ${solv_parm} \
	-cp ${complex_parm} \
	-rp ${receptor_parm} \
	-lp ${lig_parm} \
	-y ${trajectory} \
