#!/bin/bash
#Execute a production workflow
unlink ./INGRESS
unlink ./EGRESS
ln -s $1 ./INGRESS
ln -s $2 ./EGRESS
./scripts/clean.sh
nohup conda run -n nextflow_25.04.2 nextflow -log ./EGRESS/QUALITYWORKFLOW.log run -profile PRODUCTION -w $3 -N $4 main.nf > ./EGRESS/QUALITYWORKFLOW.out &