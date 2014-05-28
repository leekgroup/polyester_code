## polyester analysis for paper -- analyze the simulation
## run simulate_reads.R + preprocessing shell scripts first.

library(ballgown)
library(Biostrings)

bg = ballgown(dataDir='ballgown', samplePattern='sample')
bg22 = subset(bg, 'chr=="chr22"') # subset to only the transcripts we actually simulated from (chr22)
pData(bg22) = data.frame(id=sampleNames(bg22), group=rep(c(1,0), each=7))
statres = stattest(bg22, feature='transcript', meas='FPKM', covariate='group')
annFile = 'genes_clean.gtf'
info_table = read.table('reads/sim_info.txt', header=TRUE) #generated automatically by simulate_experiment call in the read simulation script
trulyDEids = info_table$transcriptid[info_table$DEstatus]
simResults = assessSim(bg22, statres, annotation=annFile, chr='chr22',
    trulyDEids=trulyDEids, nClosest=1, qcut=seq(0,1,by=0.01), ret=TRUE)

pdf('figure1.pdf')
    plot(1-simResults$ballgownspec, simResults$ballgownsens, 
        xlab='False Positive Rate', ylab='True Positive Rate',
        type='l', col='dodgerblue', lwd=2, main='ROC Curve for Detecting Transcript-Level DE')
dev.off()


