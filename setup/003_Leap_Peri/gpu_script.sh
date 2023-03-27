#!/bin/bash
#SBATCH --account=chm6586
#SBATCH --qos=chm6586
#SBATCH --job-name=peri_leap
#SBATCH --output=leap.out
#SBATCH --error=leap.err
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

ml cuda gcc amber/20

tleap -f leap.in
parmed mpro.wet.complex.parm7 parm.in
