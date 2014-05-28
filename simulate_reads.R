## polyester analysis for paper -- read simulation
## AF 5/7/14

library(devtools)
install_github('polyester', 'alyssafrazee')
library(polyester)
library(Biostrings)
library(ballgown)

setwd('/home/bst/student/afrazee/polyester_paper/')
fastapath = system.file("data", "chr22.fa", package="polyester")
fasta = readDNAStringSet(fastapath)

# neaten up transcript names:
ss = ballgown:::ss
ids = ss(ss(names(fasta), pattern="\\|", slot=4), pattern="\\.", slot=1)
names(fasta) = ids
writeXStringSet(fasta, file='/home/bst/student/afrazee/polyester_paper/chr22_neat.fa')

# simulate reads with 150 DE transcripts:
set.seed(142)
deInds = sample(1:length(fasta), size=150)
num_reps = 7
fold_changes = rep(1,length(fasta))
fold_changes[deInds] = rep(c(3,1/3), length(deInds)/2)
outdir = '/home/bst/student/afrazee/polyester_paper/reads/'
# ~20x coverage ----> n per tx = length/readlength * 20
readspertx = 20 * width(fasta) / 100
simulate_experiment('/home/bst/student/afrazee/polyester_paper/chr22_neat.fa', 
    reads_per_transcript=readspertx, num_reps=num_reps, fold_changes=fold_changes, outdir=outdir)

# >>>>>>>>> now run the shell scripts (tophat, cufflinks, cuffmerge, tablemaker)
