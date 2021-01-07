#!/bin/bash
# Submission script for Xanadu 
#SBATCH --job-name=braker_new_genome
#SBATCH -o %x-%j.output
#SBATCH -e %x-%j.error
#SBATCH --mail-user=vidya.vuruputoor@uconn.edu
#SBATCH --mail-type=ALL
#SBATCH --nodes=1
#SBATCH --ntasks=1 
#SBATCH --cpus-per-task=10
#SBATCH --partition=general
#SBATCH --qos=general
#SBATCH --mem=40G

module load python/3.6.3
module load biopython/1.70
#module rm  perl/5.28.1
module load perl/5.28.1
#export PERL5LIB=/labs/Wegrzyn/perl5/lib/perl5/
#export PERLINC=/labs/Wegrzyn/perl5/lib/perl5/
module load bamtools/2.5.1
module load blast/2.10.0
module load genomethreader/1.7.1
export PATH=/home/FCAM/$USER/BRAKER:/home/FCAM/$USER/BRAKER/scripts:$PATH
export AUGUSTUS_CONFIG_PATH=$HOME/Augustus/config/
export AUGUSTUS_BIN_PATH=$HOME/Augustus/bin
export TMPDIR=/home/FCAM/$USER/tmp/
export BAMTOOLS_PATH=/isg/shared/apps/bamtools/2.5.1/bin/
export BLAST_PATH=/isg/shared/apps/blast/ncbi-blast-2.10.0+/bin/
export CDBTOOLS_PATH=/home/FCAM/$USER/cdbfasta/
export SAMTOOLS_PATH=/isg/shared/apps/samtools/1.9/bin/
export GENEMARK_PATH=/home/FCAM/vvuruputoor/gmes_linux_64
export ALIGNMENT_TOOL_PATH=/isg/shared/apps/gth/1.7.1/bin/

cp ~/my_gm_key ~/.gm_key

org=/projects/EBP/Wegrzyn/Moss/Nasim_files_Braker/Moss
bam=$org/moss_hisat_flagstat/P_africana_medaka_polish_hisat/sorted_paired_polished.bam
genome=$org/moss_hisat_flagstat/P_africana_medaka_polish_hisat/genome_medaka_polish.fa
species=moss_2.1.5_new_genome
#hints=$org/moss_graph_gth.gtf
prot=$org/Physcomitrellopsis_Physco_pep/Physcomitrellopsis_Physco.pep

if [[ -d $AUGUSTUS_CONFIG_PATH/species/$species ]]; then rm -r $AUGUSTUS_CONFIG_PATH/species/$species; fi

braker.pl --cores 10 --genome="$genome" --bam="$bam" --softmasking 1 --gff3 --AUGUSTUS_CONFIG_PATH=$HOME/Augustus/config 
