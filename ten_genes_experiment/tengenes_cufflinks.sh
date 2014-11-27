#!/bin/sh

for sample in NA06985 NA12144 NA12776 NA18858 NA20542 NA20772 NA20815
do
    cat > ${sample}_estfpkm.sh <<EOF
    #!/bin/sh
    set -e
    mkdir -p $sample
    module load cufflinks
    cufflinks -q -G ../ten_genes.gtf -o $sample ${sample}_accepted_hits.bam
EOF
    qsub -cwd -l mf=5G,h_vmem=5G -pe local 4 ${sample}_estfpkm.sh
done