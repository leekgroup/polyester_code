code for Polyester paper
==============

This code depends on:
* [TopHat](http://tophat.cbcb.umd.edu/index.shtml), [Cufflinks](http://cufflinks.cbcb.umd.edu/), and [Tablemaker](https://github.com/alyssafrazee/ballgown/tree/master/tablemaker) (command-line). To reproduce this analysis, `tophat`, `cufflinks`, `cuffmerge`, and `tablemaker` need to be in your path.
* The Ballgown, Polyester, and Biostrings R packages. Install in R:
```S
install.packages('devtools') #if needed
library(devtools)
install_github('ballgown', 'alyssafrazee')
install_github('polyester', 'alyssafrazee')
source("http://bioconductor.org/biocLite.R")
biocLite('Biostrings')
```
* Annotation files: I downloaded my gene annotation [here](http://tophat.cbcb.umd.edu/igenomes.shtml) (hg19 build). This includes a folder called `Homo_sapiens` which should live in your working directory. I cleaned up the `genes.gtf` file included with this download using the `clean_gtf.R` script -- this just subsets the gtf file to only chromosomes 1-22, X, and Y. The result was `genes_clean.gtf`, which you can download [here](https://drive.google.com/file/d/0B2HiqINPidEUelF3MkdxMXNNYlE/edit?usp=sharing). `genes_clean.gtf` should also live in your working directory.
* Shell scripts use the SGE scheduling system to submit batch jobs (using `qsub`). This means the shell scripts aren't as portable as they could be: they won't be directly runnable on systems that don't use SGE.

To use this code:  
(1) run `simulate_reads.R` 

(2) run `sh tophat.sh` and wait for all TopHat jobs to finish. Note that a transcriptome index was pre-built for TopHat using [this shell script and dummy fasta files](https://github.com/alyssafrazee/ballgown_code/tree/master/simulations/tophat_transcriptome), and was put in `Homo_sapiens/UCSC/hg19/Annotation/Transcriptome/` with the prefix `known`. 

(3) run `sh cufflinks.sh` and wait for all Cufflinks jobs to finish. 

(4) Create an `assemblies.txt` file in the `assemblies` folder (that was generated in (3)), which should look like:  
```
$FOLDERNAME/assemblies/sample_01_transcripts.gtf
$FOLDERNAME/assemblies/sample_02_transcripts.gtf
$FOLDERNAME/assemblies/sample_03_transcripts.gtf
$FOLDERNAME/assemblies/sample_04_transcripts.gtf
$FOLDERNAME/assemblies/sample_05_transcripts.gtf
$FOLDERNAME/assemblies/sample_06_transcripts.gtf
$FOLDERNAME/assemblies/sample_07_transcripts.gtf
$FOLDERNAME/assemblies/sample_08_transcripts.gtf
$FOLDERNAME/assemblies/sample_09_transcripts.gtf
$FOLDERNAME/assemblies/sample_10_transcripts.gtf
$FOLDERNAME/assemblies/sample_11_transcripts.gtf
$FOLDERNAME/assemblies/sample_12_transcripts.gtf
$FOLDERNAME/assemblies/sample_13_transcripts.gtf
$FOLDERNAME/assemblies/sample_14_transcripts.gtf
```
(but replace $FOLDERNAME with the path to your working directory). 

(5) run `qsub cuffmerge.sh` and wait for the merge to finish.
 
(6) run `sh tablemaker.sh` and wait for all tablemaker jobs to finish.

(7) run `analyze_results.R` (produces Figure 1). 


