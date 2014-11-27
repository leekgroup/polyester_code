#!/bin/sh

set -e
module load cufflinks
cufflinks -q -G ../ten_genes.gtf -o ./ NA06985_accepted_hits.bam
