#!/bin/sh
set -e
mkdir -p NA20772
module load cufflinks
cufflinks -q -G ../ten_genes.gtf -o ./ NA20772_accepted_hits.bam
