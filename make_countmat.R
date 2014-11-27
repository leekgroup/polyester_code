# create the gene count matrix for the 10 selected genes 

library(GenomicAlignments)
library(ballgown)

samples = c("NA06985", "NA18858", "NA20772", "NA12144", "NA20815", "NA12776", "NA20542")
bf = paste0(samples, '/', samples, '_accepted_hits.bam')
fls = BamFileList(bf)
names(fls) = ballgown:::ss(bf, '_', slot=1) 
geneList = gffReadGR('ten_genes.gtf', splitByTranscript=TRUE, identifier='gene_name')
gene_counts = summarizeOverlaps(features=geneList, reads=fls, ignore.strand=FALSE)
countmat = assay(gene_counts)
save(countmat, file='countmat.rda')
