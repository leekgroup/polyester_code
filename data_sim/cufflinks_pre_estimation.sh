#!/bin/sh
#$ -cwd -l mf=20G,h_vmem=5G -pe local 4

module load cufflinks

outdir=abundances
mkdir -p $outdir

wget --passive-ftp http://www.ebi.ac.uk/arrayexpress/files/E-GEUV-6/NA12778_accepted_hits.bam
wget --passive-ftp http://www.ebi.ac.uk/arrayexpress/files/E-GEUV-6/NA07048_accepted_hits.bam
wget --passive-ftp http://www.ebi.ac.uk/arrayexpress/files/E-GEUV-6/NA12760_accepted_hits.bam
wget --passive-ftp http://www.ebi.ac.uk/arrayexpress/files/E-GEUV-6/NA12889_accepted_hits.bam
wget --passive-ftp http://www.ebi.ac.uk/arrayexpress/files/E-GEUV-6/NA20761_accepted_hits.bam
wget --passive-ftp http://www.ebi.ac.uk/arrayexpress/files/E-GEUV-6/NA20798_accepted_hits.bam
wget --passive-ftp http://www.ebi.ac.uk/arrayexpress/files/E-GEUV-6/NA20518_accepted_hits.bam
wget --passive-ftp http://www.ebi.ac.uk/arrayexpress/files/E-GEUV-6/NA20532_accepted_hits.bam
# other BAM files already downloaded

cufflinks -q -p 4 -o $outdir/NA06985 -G chr22.gtf ../NA06985_accepted_hits.bam
cufflinks -q -p 4 -o $outdir/NA12144 -G chr22.gtf ../NA12144_accepted_hits.bam
cufflinks -q -p 4 -o $outdir/NA12776 -G chr22.gtf ../NA12776_accepted_hits.bam
cufflinks -q -p 4 -o $outdir/NA20542 -G chr22.gtf ../NA20542_accepted_hits.bam
cufflinks -q -p 4 -o $outdir/NA20772 -G chr22.gtf ../NA20772_accepted_hits.bam
cufflinks -q -p 4 -o $outdir/NA20815 -G chr22.gtf ../NA20815_accepted_hits.bam
cufflinks -q -p 4 -o $outdir/NA12778 -G chr22.gtf ../NA12778_accepted_hits.bam
cufflinks -q -p 4 -o $outdir/NA07048 -G chr22.gtf ../NA07048_accepted_hits.bam
cufflinks -q -p 4 -o $outdir/NA12760 -G chr22.gtf ../NA12760_accepted_hits.bam
cufflinks -q -p 4 -o $outdir/NA12889 -G chr22.gtf ../NA12889_accepted_hits.bam
cufflinks -q -p 4 -o $outdir/NA20761 -G chr22.gtf ../NA20761_accepted_hits.bam
cufflinks -q -p 4 -o $outdir/NA20798 -G chr22.gtf ../NA20798_accepted_hits.bam
cufflinks -q -p 4 -o $outdir/NA20518 -G chr22.gtf ../NA20518_accepted_hits.bam
cufflinks -q -p 4 -o $outdir/NA20532 -G chr22.gtf ../NA20532_accepted_hits.bam

