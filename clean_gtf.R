## take out everything except chr1-22, X, Y from the genes gtf file
## af 10/28/13

library(ballgown) #need the gffRead function

canonical_chr = c("chr1", "chr2", "chr3",
    "chr4", "chr5", "chr6",
    "chr7", "chr8", "chr9",
    "chr10", "chr11", "chr12",
    "chr13", "chr14", "chr15",
    "chr16", "chr17", "chr18",
    "chr19", "chr20", "chr21",
    "chr22", "chrX", "chrY")

genes = gffRead("/amber2/scratch/jleek/iGenomes-index/Homo_sapiens/UCSC/hg19/Annotation/Genes/genes.gtf")
genes = subset(genes, seqname %in% canonical_chr)
write.table(genes, 
    file="/amber2/scratch/jleek/iGenomes-index/Homo_sapiens/UCSC/hg19/Annotation/Genes/genes_clean.gtf",
    row.names=FALSE, col.names=FALSE,
    quote=FALSE,
    sep="\t")
