#!/bin/sh
#$ -cwd -l mf=10G,h_vmem=10G

set -e
set -u

ASSEMBLYFILE=assemblies/assemblies.txt
OUTDIR=assemblies/merged
REFSEQ=Homo_sapiens/UCSC/hg19/Sequence/Bowtie2Index/genome.fa

cuffmerge -s $REFSEQ -o $OUTDIR $ASSEMBLYFILE
