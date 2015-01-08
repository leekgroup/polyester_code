#!/bin/sh

SLIST=`seq -f %02.0f 1 14`
GTF=../chr22.gtf

for sample in $SLIST
do
    OUTDIR=abundances/sample${sample}
    mkdir -p $OUTDIR
    cat > cufflinks_$sample.sh <<EOF
    #!/bin/sh
    cufflinks -q -o $OUTDIR -G $GTF alignments/sample${sample}_accepted_hits.bam
EOF
qsub -l mf=5G,h_vmem=5G cufflinks_$sample.sh
done
