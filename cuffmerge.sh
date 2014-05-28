#!/bin/sh
#$ -cwd -l mf=10G,h_vmem=10G

set -e
set -u

ANNOTATIONPATH=/amber2/scratch/jleek/iGenomes-index
SOFTWAREPATH=/home/bst/student/afrazee/software
FOLDERNAME=/home/bst/student/afrazee/polyester_paper
CUFFMERGE=$SOFTWAREPATH/cufflinks-2.1.1.Linux_x86_64/cuffmerge
ASSEMBLYFILE=$FOLDERNAME/assemblies/assemblies.txt
OUTDIR=$FOLDERNAME/assemblies/merged
REFSEQ=$ANNOTATIONPATH/Homo_sapiens/UCSC/hg19/Sequence/Bowtie2Index/genome.fa

$CUFFMERGE -s $REFSEQ -o $OUTDIR $ASSEMBLYFILE
