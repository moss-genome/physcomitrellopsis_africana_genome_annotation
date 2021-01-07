#!/bin/bash
#SBATCH --job-name=indexbuild
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 12
#SBATCH --partition=general
#SBATCH --qos=general
#SBATCH --mail-type=END
#SBATCH --mail-user=vidya.vuruputoor@uconn.edu
#SBATCH --mem=50G
#SBATCH -o indexbuild_%j.out
#SBATCH -e indexbuild_%j.err
module load hisat2/2.2.1
hisat2-build -p 12 genome_medaka_polish.fa  P.africana_medaka_polish
