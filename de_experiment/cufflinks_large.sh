#!/bin/sh

# run cufflinks on simulated datasets

SLIST=`seq -f %02.0f 1 14`
GTF=../chr22.gtf

for sample in $SLIST
do
    OUTDIR=assemblies/large_variance/sample${sample}
    mkdir -p $OUTDIR
    cat > cufflinks_large_$sample.sh <<EOF
    #!/bin/sh
    cufflinks -q -p 4 -o $OUTDIR -G $GTF alignments/large_variance/sample${sample}_accepted_hits.bam
EOF
qsub -l mf=10G,h_vmem=10G -pe local 4 cufflinks_large_$sample.sh
done

