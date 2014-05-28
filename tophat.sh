#!/bin/sh

# run tophat on simulated dataset

ANNOTATIONPATH=/amber2/scratch/jleek/iGenomes-index

transcriptomeIndex=$ANNOTATIONPATH/Homo_sapiens/UCSC/hg19/Annotation/Transcriptome/known
bowtieIndex=$ANNOTATIONPATH/Homo_sapiens/UCSC/hg19/Sequence/Bowtie2Index/genome
FOLDERNAME=/home/bst/student/afrazee/polyester_paper
dataDir=$FOLDERNAME/reads
SLIST=`seq -f %02.0f 1 14`

for sample in $SLIST
do
    outdir=$FOLDERNAME/alignments/sample${sample}
    cat > $FOLDERNAME/tophat_${sample}.sh <<EOF
    #!/bin/sh
    set -e
    module load tophat
    mkdir -p $outdir
    tophat -o $outdir -p 1 --transcriptome-index $transcriptomeIndex $bowtieIndex $dataDir/sample_${sample}_1.fasta $dataDir/sample_${sample}_2.fasta
    mv $outdir/accepted_hits.bam $FOLDERNAME/alignments/sample${sample}_accepted_hits.bam 
EOF
    qsub -cwd -l mf=20G,h_vmem=5G -m n $FOLDERNAME/tophat_${sample}.sh
done

