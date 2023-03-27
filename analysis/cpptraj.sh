#!/bin/bash
#SBATCH --job-name=cpptraj_min
#SBATCH --output=minimage.out
#SBATCH --error=minimage.err
#SBATCH --account=colina
#SBATCH --qos=colina
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --distribution=block:block
#SBATCH --time=7-00:00:00
#SBATCH --mem-per-cpu=10gb
#SBATCH --partition=gpu
#SBATCH --gres=gpu:a100:1

##SBATCH --mail-type=none
#SBATCH --mail-user=some_user@some_domain.com

#ml cuda/10.0.130 namd/3.0 vmd
module load  cuda/11.1.0 nvhpc/20.11 openmpi/4.0.5 amber/20

#cpptraj -i image.in
#cpptraj -i cpptraj.in
#cpptraj -i cpp_hbond.in
cpptraj native.in
#cpptraj -i cpptraj1.in
#cpptraj -i hydrophobic.in
#vmd -dispdev text -e sasa.tcl



