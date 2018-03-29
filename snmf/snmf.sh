#!/bin/bash
vcf=$1
outputs=$2
logs=$3
best_k_output=$4
best_k_logfile=$5
kmin=$6
kmax=$7
groups=$8
threshold_group=$9

directory=`dirname $0`
mkdir /tool/tmpdir$$

./snmf -i $vcf -o $outputs -k $kmin -m $kmax -d /tool/tmpdir$$ -t $threshold_group

mv /tool/tmpdir$$/output $best_k_output
mv /tool/tmpdir$$/log $best_k_logfile
mv /tool/tmpdir$$/outputs.Q $outputs
mv /tool/tmpdir$$/logs $logs
mv /tool/tmpdir$$/groups $groups
