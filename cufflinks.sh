#!/bin/sh

# run cufflinks on simulated dataset

SLIST=`seq -f %02.0f 1 14`
GTF=genes_clean.gtf

for sample in $SLIST
do
    OUTDIR=assemblies/sample${sample}
    mkdir -p $OUTDIR
    cat > cufflinks_$sample.sh <<EOF
    #!/bin/sh
    cufflinks -q -p 4 -o $OUTDIR -G $GTF alignments/sample${sample}_accepted_hits.bam
    mv $OUTDIR/transcripts.gtf assemblies/sample_${sample}_transcripts.gtf
EOF
qsub -l mf=10G,h_vmem=3G -pe local 4 cufflinks_$sample.sh
done

