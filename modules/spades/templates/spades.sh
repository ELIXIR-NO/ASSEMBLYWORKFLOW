#!/bin/bash
spades.py --threads $spadesThreads -o $spadesOUT -1 $spadesIN1 -2 $spadesIN2
cp -r $spadesOUT $egressPath/$spadesOUT
cp $spadesOUT/contigs.fasta $spades_contigsFilename