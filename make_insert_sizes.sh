#!/bin/sh
for sample in NA06985 NA18858 NA20772 NA12144 NA20815 NA12776 NA20542
do
     java -Xmx2g -jar picard-tools-1.121/CollectInsertSizeMetrics.jar HISTOGRAM_FILE=${sample}/${sample}_histogram INPUT=${sample}/${sample}_accepted_hits.bam OUTPUT=${sample}/${sample}_metrics
done
