#!/bin/bash
unlink ./INGRESS
unlink ./EGRESS
ln -s $1 ./INGRESS
ln -s $2 ./EGRESS
./scripts/clean.sh
nohup conda run -n nextflow_25.04.2 nextflow -log ./EGRESS/ASSEMBLYPIPELINE.log run -profile ASSEMBLYPIPELINE -w $3 -N $4 ./modules/ASSEMBLYPIPELINE/main.nf > ./EGRESS/ASSEMBLYPIPELINE.out &