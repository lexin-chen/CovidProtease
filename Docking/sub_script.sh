#!/bin/bash
#SBATCH --account=chm6586
#SBATCH --qos=chm6586
#SBATCH --job-name=docking
#SBATCH --output=docking.out
#SBATCH --error=docking.err
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

cd ./Ligands.out/
	for f in *.pdbqt;do
	b="$(basename $f .pdbqt)"
	echo Processing ligand $b
	/blue/chm6586/le.chen/autodock_vina_1_1_2_linux_x86/bin/vina --ligand $f --config /blue/chm6586/le.chen/Covid_Protease/Explicit/Docking/conf.txt --log ${b}_log.txt
	/blue/chm6586/le.chen/autodock_vina_1_1_2_linux_x86/bin/vina_split --input $f
done
