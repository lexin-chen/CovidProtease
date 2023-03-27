#!/bin/bash
#SBATCH --account=colina
#SBATCH --qos=colina
#SBATCH --job-name=antechamber
#SBATCH --output=antechamber.out
#SBATCH --error=antechamber.err
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

#antechamber -i ../001_Structure/boceprevir_final.mol2 -fi mol2 -o boce_ligand_antechamber.mol2 -fo mol2 -at gaff2 -c bcc -rn LIG -nc 0
#parmchk2 -i boce_ligand_antechamber.mol2 -f mol2 -o boce_ligand.am1bcc.frcmod


antechamber -i ../001_Structure/bromocriptine_final.mol2 -fi mol2 -o bro_ligand_antechamber.mol2 -fo mol2 -at gaff2 -c bcc -rn LIG -nc 1
parmchk2 -i bro_ligand_antechamber.mol2 -f mol2 -o bro_ligand.am1bcc.frcmod


antechamber -i ../001_Structure/periciazine_final.mol2 -fi mol2 -o peri_ligand_antechamber.mol2 -fo mol2 -at gaff2 -c bcc -rn LIG -nc 1
parmchk2 -i peri_ligand_antechamber.mol2 -f mol2 -o peri_ligand.am1bcc.frcmod


#antechamber -i ../001_Structure/manidipine_final.mol2 -fi mol2 -o mani_ligand_antechamber.mol2 -fo mol2 -at gaff2 -c bcc -rn LIG -nc 1
#parmchk2 -i mani_ligand_antechamber.mol2 -f mol2 -o mani_ligand.am1bcc.frcmod




