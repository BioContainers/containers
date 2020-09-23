#!/bin/bash

# args: vcf ids sex phenotypes covariates

output_basename=$(basename $1 .vcf.gz)

plink \
  --vcf $1 \
  --maf 0.10 \
  --update-ids $2 \
  --make-bed \
  --out $output_basename

plink \
  --bfile $output_basename \
  --update-sex $3 \
  --pheno $4 \
  --make-bed \
  --out $output_basename

plink \
  --bfile $output_basename \
  --covar $5 \
  --dummy-coding \
  --write-covar

plink \
  --bfile $output_basename \
  --logistic \
  --covar plink.cov \
  --out $output_basename

sed -i -e 's/\s\+/,/g' -e 's/^,//g' -e 's/,$//g' $output_basename.assoc.logistic
