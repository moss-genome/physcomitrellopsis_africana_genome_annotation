#!/bin/bash
#SBATCH --job-name=hisat2run
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 16
#SBATCH --partition=general
#SBATCH --qos=general
#SBATCH --mail-type=END
#SBATCH --mail-user=vidya.vuruputoor@uconn.edu
#SBATCH --mem=50G
#SBATCH -o hisat2run_%j.out
#SBATCH -e hisat2run_%j.err
module load hisat2/2.2.1
module load samtools/1.9
hisat2 -x P.africana_medaka_polish -1 /projects/EBP/Wegrzyn/Moss/Physcomitrellopsis_africana/Physcomitrellopsis_africana_Genome/new_annotation/HISAT2/paired_1.fq -2 /projects/EBP/Wegrzyn/Moss/Physcomitrellopsis_africana/Physcomitrellopsis_africana_Genome/new_annotation/HISAT2/paired_2.fq -p 16 -S paired.sam
samtools view -@ 16 -uhS paired.sam | samtools sort -@ 16 -o sorted_paired_polished.bam

