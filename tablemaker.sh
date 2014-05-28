#!/bin/sh

set -e
set -u

SOFTWAREPATH=/home/bst/student/afrazee/software
SLIST=`seq -f %02.0f 1 14`
TABLEMAKER=$SOFTWAREPATH/tablemaker-2.1.1.Linux_x86_64/tablemaker
FOLDERNAME=/home/bst/student/afrazee/polyester_paper
MERGEDASSEMBLY=$FOLDERNAME/assemblies/merged/merged.gtf
OUTDIR=$FOLDERNAME/ballgown
ALIGNMENTDIR=$FOLDERNAME/alignments

for sample in $SLIST
do
  cat > $FOLDERNAME/ballgown_$sample.sh <<EOF
  #!/bin/sh
  $TABLEMAKER -q -W -G $MERGEDASSEMBLY -o $OUTDIR/sample${sample} $ALIGNMENTDIR/sample${sample}_accepted_hits.bam
EOF
  qsub -l mf=10G,h_vmem=3G -pe local 4 $FOLDERNAME/ballgown_$sample.sh 
done

# these are probably ~2 minute jobs or less, but let's just run them all in parallel anyway


