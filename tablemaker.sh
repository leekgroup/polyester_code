#!/bin/sh

set -e
set -u

SLIST=`seq -f %02.0f 1 14`
MERGEDASSEMBLY=assemblies/merged/merged.gtf
OUTDIR=ballgown
ALIGNMENTDIR=alignments

for sample in $SLIST
do
  cat > ballgown_$sample.sh <<EOF
  #!/bin/sh
  tablemaker -q -W -G $MERGEDASSEMBLY -o $OUTDIR/sample${sample} $ALIGNMENTDIR/sample${sample}_accepted_hits.bam
EOF
  qsub -l mf=10G,h_vmem=3G -pe local 4 ballgown_$sample.sh 
done

# these are probably ~2 minute jobs or less, but let's just run them all in parallel anyway


