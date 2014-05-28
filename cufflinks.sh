#!/bin/sh

# run cufflinks on simulated dataset

ANNOTATIONPATH=/amber2/scratch/jleek/iGenomes-index
SOFTWAREPATH=/home/bst/student/afrazee/software
SLIST=`seq -f %02.0f 1 14`
CUFFLINKS=$SOFTWAREPATH/cufflinks-2.2.1.Linux_x86_64/cufflinks
FOLDERNAME=/home/bst/student/afrazee/polyester_paper
GTF=$ANNOTATIONPATH/Homo_sapiens/UCSC/hg19/Annotation/Genes/genes_clean.gtf

for sample in $SLIST
do
    OUTDIR=$FOLDERNAME/assemblies/sample${sample}
    mkdir -p $OUTDIR
    cat > $FOLDERNAME/cufflinks_$sample.sh <<EOF
    #!/bin/sh
    $CUFFLINKS -q -p 4 -o $OUTDIR -G $GTF $FOLDERNAME/alignments/sample${sample}_accepted_hits.bam
    mv $OUTDIR/transcripts.gtf $FOLDERNAME/assemblies/sample_${sample}_transcripts.gtf
EOF
qsub -l mf=10G,h_vmem=3G -pe local 4 $FOLDERNAME/cufflinks_$sample.sh
done

