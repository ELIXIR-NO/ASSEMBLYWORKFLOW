#!/bin/bash
#Default pipeline or stage egress for contigs.fasta
if [ ! -f $egressOUT ]; then
	cp $egressIN $egressOUT
fi

#Record the files
echo '$egressIN $egressOUT' >> $egressPath/ASSEMBLYPIPELINE_egressedFiles.txt