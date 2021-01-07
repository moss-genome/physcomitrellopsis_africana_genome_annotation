#!/bin/bash
# Submission script for Xanadu 
#SBATCH --job-name=braker_old
#SBATCH -o braker_old-%j.output
#SBATCH -e braker_old-%j.error
#SBATCH --mail-user=vidya.vuruputoor@uconn.edu
#SBATCH --mail-type=ALL
#SBATCH --nodes=1
#SBATCH --ntasks=1 
#SBATCH --cpus-per-task=8
#SBATCH --partition=general
#SBATCH --qos=general
#SBATCH --mem=40G

module load BRAKER/2.0.5
module unload augustus/3.3.3   
module unload GeneMark-ET/4.59  
module load perl/5.28.1

#maker sure you set these to your local augustus copy
export AUGUSTUS_CONFIG_PATH=/home/FCAM/vvuruputoor/Augustus/config
export GENEMARK_PATH=/home/FCAM/vvuruputoor/gmes_linux_64
export BAMTOOLS_PATH=/isg/shared/apps/bamtools/2.5.1/bin/
export SAMTOOLS_PATH=/isg/shared/apps/samtools/1.9/bin/
export AUGUSTUS_BIN_PATH=$HOME/Augustus/bin
export BLAST_PATH=/isg/shared/apps/blast/ncbi-blast-2.10.0+/bin/
export CDBTOOLS_PATH=/home/FCAM/$USER/cdbfasta/
export ALIGNMENT_TOOL_PATH=/isg/shared/apps/gth/1.7.1/bin/

cp ~/my_gm_key ~/.gm_key

org=/projects/EBP/Wegrzyn/Moss/Nasim_files_Braker/Moss
bam=$org/input_files/moss_sorted_paired.bam
genome=$org/input_files/genome/final_assembly.fa.masked
species=moss_old
#hints=$org/moss_graph_gth.gtf
prot=$org/input_files/Physcomitrellopsis_Physco_pep/Physcomitrellopsis_Physco.pep

if [[ -d $AUGUSTUS_CONFIG_PATH/species/$species ]]; then rm -r $AUGUSTUS_CONFIG_PATH/species/$species; fi

braker.pl  --cores 8 --species="$species" --genome="$genome" --bam="$bam" --softmasking 1 --gff3 --AUGUSTUS_CONFIG_PATH=$HOME/Augustus/config 
