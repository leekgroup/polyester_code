code for Polyester paper
==============

This code depends on:
* [TopHat](http://tophat.cbcb.umd.edu/index.shtml), [Cufflinks](http://cufflinks.cbcb.umd.edu/), and [Tablemaker](https://github.com/alyssafrazee/ballgown/tree/master/tablemaker) (command-line)
* The Ballgown, Polyester, and Biostrings R packages. Install in R:
```S
install.packages('devtools') #if needed
library(devtools)
install_github('ballgown', 'alyssafrazee')
install_github('polyester', 'alyssafrazee')
source("http://bioconductor.org/biocLite.R")
biocLite('Biostrings')
```
* Annotation files: I downloaded my gene annotation [here](http://tophat.cbcb.umd.edu/igenomes.shtml) (hg19 build). The `ANNOTATIONPATH` environment variable in the shell scripts should point to the directory containing the `Homo_sapiens` folder included with this download. I cleaned up the `genes.gtf` file included with this download using the `clean_gtf.R` script -- this just subsets the gtf file to only chromosomes 1-22, X, and Y. The result was `genes_clean.gtf`, which you can download [here](https://drive.google.com/file/d/0B2HiqINPidEUelF3MkdxMXNNYlE/edit?usp=sharing). 
* Shell scripts use the SGE scheduling system (specifically the `qsub` command to submit batch jobs) and call our cluster's `module` command to configure the `PATH`. The portability of these scripts to other computing systems leaves something to be desired -- they will likely need heavy editing to run on other systems.

To use this code:  
  1. run `simulate_reads.R` (change working directory as needed)  
  2. run `sh tophat.sh` and wait for all TopHat jobs to finish. Change `ANNOTATIONPATH` and `FOLDERNAME` (`FOLDERNAME` should be the working directory from (1)). Also note that a transcriptome index was pre-built for TopHat using [this shell script and dummy fasta files](https://github.com/alyssafrazee/ballgown_code/tree/master/simulations/tophat_transcriptome).  
  3. run `sh cufflinks.sh` and wait for all Cufflinks jobs to finish. Change `ANNOTATIONPATH` and `FOLDERNAME` (same as in (2)), `CUFFLINKS` (to point to your Cufflinks binary), and `GTF` (to point to `genes_clean.gtf`)  
  4. run `qsub cuffmerge.sh` and wait for the merge to finish. Change `ANNOTATIONPATH`, and `FOLDERNAME` (as in (2) and (3)), and change `CUFFMERGE` to point to your Cuffmerge binary. You should also create an `assemblies.txt` file in the `assemblies` folder (that was generated in (3)), which should look like:
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
  (but replace $FOLDERNAME with the actual value of `FOLDERNAME`).  
  5. run `sh tablemaker.sh`. Change `TABLEMAKER` to point to the tablemaker binary, and change `FOLDERNAME` (as in (2)-(4)).  
  6. run `analyze_results.R` (produces Figure 1. Change working directory as needed).   


