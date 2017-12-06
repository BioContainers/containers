#!/bin/bash

outdir='./qc'
mode='identification'
miss=0
enzyme=1
varmod=2
fixmod=1
tol=10
itol=0.6
cpu=2

while true; do
  if [ "$1" = "-h" ]; then
      shift;
      echo "\nUsage: proteoQC -s [spectralist] -f [fasta] -[options] [values]\n"
      echo "Options:\n"
      echo "-s    A file contains the experiment design or a single mgf file"
      echo "-f    Database file, must contain decoy sequences"
      echo "-o    Output directory | default: ./result";
      echo "-d    Identification or quantification | default: identification"
      echo "-m    Max miss clevages | default: 0"
      echo "-e    Enzyme | default: 1"
      echo "-v    Variable modifications are those which may or may not be present | default: 2"
      echo "-x    Fixed modifications are applied universally, to every instance of the specified residue(s) or terminus | default: 1"
      echo "-t    The error window on experimental peptide mass values | default: 10"
      echo "-i    Error window for MS/MS fragment ion mass values | default: 0.6"
      echo "-c    Max number of cpu used | default: 2"
  else
    case $1 in
      -s  )
        shift; spectralist=$1; shift;;
      -f  )
        shift; fasta=$1; shift;;
      -o  )
        shift; outdir=$1; shift ;;
      -d  )
        shift; mode=$1; shift ;;
      -m  )
        shift; miss=$1; shift ;;
      -e  )
        shift; enzyme=$1; shift ;;
      -v  )
        shift; varmod=$1; shift ;;
      -x  )
        shift; fixmod=$1; shift ;;
      -t  )
        shift; tol=$1; shift ;;
      -i  )
        shift; itol=$1; shift ;;
      -c  )
        shift; cpu=$1; shift ;;
      -*  )
        echo "$0: Unrecognized option $1" >&2
        exit 2;;
      *) break ;;
    esac


    #RUN
    R -e "library(proteoQC);\
          fas <- unzip('$fasta');\
          design <- '$spectralist';\
          qcres <- msQCpipe(spectralist=design,fasta=fas,outdir ='$outdir',\
          miss=$miss,enzyme=$enzyme,varmod=$varmod,fixmod=$fixmod,\
          tol=$tol,itol=$itol,cpu=$cpu,mode='$mode');\
          zpqc <- system.file('extdata/qc.zip', package='proteoQC');\
          unzip(zpqc);\
          qcres <- loadmsQCres('./qc');\
          html <- reportHTML(qcres)"
    fi
  done
