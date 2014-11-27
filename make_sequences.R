## code for "sequences.rda"

library(ballgown)
library(polyester)
load('fpkm.rda')
expressed = exprfilter(fpkm, cutoff=1)
fullgtfdf = gffRead('merged.gtf')
fullgtfdf$t_name = getAttributeField(fullgtfdf$attributes, 'transcript_id')
fullgtfdf$t_name = substr(fullgtfdf$t_name, 2, nchar(fullgtfdf$t_name)-1)
stopifnot(length(unique(fullgtfdf$t_name)) == length(structure(fpkm)$trans))
expresseddf = subset(fullgtfdf, t_name %in% texpr(expressed, 'all')$t_name)
gtfdf = expresseddf[,-10] #need a 9-column data frame
seqpath = 'Homo_sapiens/UCSC/hg19/Sequence/Chromosomes/'
sequences = seq_gtf(gtfdf, seqpath)
names(sequences) = substr(names(sequences), 2, nchar(names(sequences))-1)
save(sequences, file='sequences.rda') 
