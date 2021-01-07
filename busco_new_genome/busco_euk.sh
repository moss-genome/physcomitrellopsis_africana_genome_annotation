#!/bin/bash
#SBATCH --job-name=busco
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 1
#SBATCH --partition=general
#SBATCH --qos=general
#SBATCH --mail-type=END
#SBATCH --mem=5G
#SBATCH -o %x_%j.out
#SBATCH -e %x_%j.err

module load busco/4.1.2
export AUGUSTUS_CONFIG_PATH=$HOME/Augustus/config/

busco -i /projects/EBP/Wegrzyn/Moss/Nasim_files_Braker/Moss/moss_hisat_flagstat/P_africana_medaka_polish_hisat/genome_medaka_polish.fa -l eukaryota_odb10 -o Moss -m genome
