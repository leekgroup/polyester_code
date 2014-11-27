#!/bin/sh

# run cufflinks on simulated datasets

SLIST=`seq -f %02.0f 1 7`
GTF=../ten_genes.gtf

for sample in $SLIST
do
    OUTDIR=assemblies_bias/sample${sample}
    mkdir -p $OUTDIR
    cat > cufflinks_bias_$sample.sh <<EOF
    #!/bin/sh
    module load cufflinks
    cufflinks -q -p 4 -o $OUTDIR -G $GTF alignments_bias/sample${sample}_accepted_hits.bam
EOF
qsub -l mf=10G,h_vmem=10G -pe local 4 cufflinks_bias_$sample.sh
done

