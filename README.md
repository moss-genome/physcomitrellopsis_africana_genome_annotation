# _Physomitrellopsis africana_ BRAKER genome annotation

**Genome 1 refers to the initially assembled genome (in the scripts this is the "old genome"), and Genome 2 refers to the genome after assembling with flye and multiple rounds of medaka polishing (referred to the new genome in the scripts)**

Summary of all results is documented on this [spreadsheet](https://docs.google.com/spreadsheets/d/1nD2lru3QTsvsn6HtXip9XP7PTvCHfbWFkLESv1-goLE/edit?usp=sharing)

## Input files for BRAKER annotation
1. Genome files (Genome 1 and Genome 2)
2. RNA-seq library generated for _P. africana_
3. Protein files
   1. Protein file with both _P. africana_ and _Physomitrium patens_
   2. Only _P. africana_ proteins

## BUSCO scores for the genome
BUSCO was run for the genome produced after the [genome asssembly of _P. africana_](https://github.com/moss-genome/physcomitrellopsis_africana_genome_assembly). The genome was run against the eukaryota and viridiplantae databases.

## Mapping rates of transcriptomic libraries using HISAT2
Ran HISAT2 to check mapping rates of the for:

| Transcriptome input | Genome input | Mapping rate |
| ----------- | -------- | ------|
| _P. africana_ trimmed transcriptomic reads | Genome 1 | 90.06% |
| _P. africana_ untrimmed transcriptomic reads | Genome 1 | 69.90% |
| _P. patens_ trimmed reads | Genome 1 | 42.62% |
| _P. africana_ trimmed transcriptomic reads | Genome 2 | 90.62% |

With this, we know that the RNA-seq libraries are definitely of _P. africana_ based on the higher mapping rates compared to _P. patens_

## BRAKER runs with Genome (repeated for both Genome 1 and Genome 2)
Multiple iterations of BRAKER were run (repeated for BRAKER v2.0.5 and BRAKER v2.1.5)
1. Only genome + bam file from transcriptome
2. Genome + bam + protein from _P. africana_ and _P. patens_

There were additional runs of BRAKER run, for troubleshooting purposes (for only v2.1.5):
1. Genome +  _P. patens_ bam file
2. Genome + bam + protein from _P. africana_
