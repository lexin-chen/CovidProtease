#!/bin/bash
#SBATCH --account=colina
#SBATCH --qos=colina
#SBATCH --job-name=boce_prmmgbsa
#SBATCH --output=mmpbsa.out
#SBATCH --error=mmpbsa.err
#SBATCH --ntasks=75
#SBATCH --cpus-per-task=1
#SBATCH --ntasks-per-node=25
#SBATCH --distribution=cyclic:cyclic
#SBATCH --time=7-00:00:00
#SBATCH --mem-per-cpu=5gb

cd $SLURM_SUBMIT_DIR

export OMP_NUM_THREADS=75
module load  cuda/11.1.0 intel/2020.0.166 openmpi/4.0.4 amber/20

solv_parm="../../003_Leap_Boce/mpro.wet.complex.parm7"
complex_parm="../../003_Leap_Boce/mpro.complex.parm7"
receptor_parm="../../003_Leap_Boce/mpro.gas.receptor.parm7"
lig_parm="../../003_Leap_Boce/mpro.gas.ligand.parm7"
trajectory="../../WetComplex_Boce/md.nc"

$AMBERHOME/bin/MMPBSA.py -O -i per-residue.in \
	-o FINAL_RESULTS_MMPBSA.dat \
	-do FINAL_DECOMP_MMPBSA.dat \
	-sp ${solv_parm} \
	-cp ${complex_parm} \
	-rp ${receptor_parm} \
	-lp ${lig_parm} \
	-y ${trajectory} \
