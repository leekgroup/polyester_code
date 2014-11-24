# create the gene count matrix for the 10 selected genes 

library(GenomicAlignments)
library(ballgown)

bf = list.files(pattern='*.bam$') # must only have the 7 bam files in dir
fls = BamFileList(bf)
names(fls) = ballgown:::ss(bf, '_', slot=1) 
geneList = gffReadGR('ten_genes.gtf', splitByTranscript=TRUE, identifier='gene_name')
gene_counts = summarizeOverlaps(features=geneList, reads=fls, ignore.strand=FALSE)
countmat = assay(gene_counts)
save(countmat, file='countmat.rda')
