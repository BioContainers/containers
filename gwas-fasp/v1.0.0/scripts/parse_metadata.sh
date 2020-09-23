#!/bin/bash

usage() {
cat << EOF
Create files for importing PLINK data from a VCF
Produces 4 files in the pwd: 'coviarates.txt, phenotypes.txt, sex.txt, ids.txt'
Usage: $0 -c metadata_csv
OPTIONS:
  -h    Print this message and exit
  -c    Metadata CSV
EOF
}

while getopts "hc:" OPTION; do
	case $OPTION in
		h) usage; exit;;
		c) METADATA_CSV=$OPTARG;;
		\?) usage; exit;;
	esac
done

if [ ! -e "${METADATA_CSV}" ]; then
	usage
	echo "ERROR: Please supply metadata CSV."
	exit 1
fi

# generate covariates file using Super_Population column
echo "FID IID Super_Population" > covariates.txt
awk -vFPAT='[^,]*|"[^"]*"' 'NR > 1 {print $2,$1,$61}' "${METADATA_CSV}" >> covariates.txt
## recode covariates to numerical
sed -i -e 's/AFR$/1/g' -e 's/AMR$/2/g' -e 's/EAS$/3/g' -e 's/EUR$/4/g' -e 's/SAS$/5/g' covariates.txt

# generate phenotypes file; assume phenotype is in the last column
echo "FID IID Simulated_disease" > phenotypes.txt
awk -vFPAT='[^,]*|"[^"]*"' 'NR > 1 {print $2,$1,$NF}' "${METADATA_CSV}" >> phenotypes.txt

# generate sex file
echo "FID IID Sex" > sex.txt
awk -vFPAT='[^,]*|"[^"]*"' 'NR > 1 {{if ($5=="female") sex=2; else if ($5=="male") sex=1; else sex=0} {print $2,$1,sex}}' "${METADATA_CSV}" >> sex.txt

# generate ID update file
echo "OLD_FID OLD_IID NEW_FID NEW_IID" > ids.txt
awk -vFPAT='[^,]*|"[^"]*"' 'NR > 1 {print $1,$1,$2,$1}' "${METADATA_CSV}" >> ids.txt
