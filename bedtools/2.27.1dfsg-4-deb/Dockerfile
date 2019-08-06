FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="bedtools" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="bedtools" \ 
    about.summary="suite of utilities for comparing genomic features" \ 
    about.home="https://github.com/arq5x/bedtools2" \ 
    software.version="2.27.1dfsg-4-deb" \ 
    upstream.version="2.27.1" \ 
    version="1" \ 
    extra.identifiers.biotools="bedtools" \ 
    about.copyright=" 2009,2010,2011 Aaron Quinlan" \ 
    about.license="GPL-2" \ 
    about.license_file="/usr/share/doc/bedtools/copyright" \ 
    extra.binaries="/usr/bin/annotateBed,/usr/bin/bamToBed,/usr/bin/bamToFastq,/usr/bin/bed12ToBed6,/usr/bin/bedToBam,/usr/bin/bedToIgv,/usr/bin/bedpeToBam,/usr/bin/bedtools,/usr/bin/closestBed,/usr/bin/clusterBed,/usr/bin/complementBed,/usr/bin/coverageBed,/usr/bin/expandCols,/usr/bin/fastaFromBed,/usr/bin/flankBed,/usr/bin/genomeCoverageBed,/usr/bin/getOverlap,/usr/bin/groupBy,/usr/bin/intersectBed,/usr/bin/linksBed,/usr/bin/mapBed,/usr/bin/maskFastaFromBed,/usr/bin/mergeBed,/usr/bin/multiBamCov,/usr/bin/multiIntersectBed,/usr/bin/nucBed,/usr/bin/pairToBed,/usr/bin/pairToPair,/usr/bin/randomBed,/usr/bin/shiftBed,/usr/bin/shuffleBed,/usr/bin/slopBed,/usr/bin/sortBed,/usr/bin/subtractBed,/usr/bin/tagBam,/usr/bin/unionBedGraphs,/usr/bin/windowBed,/usr/bin/windowMaker" \ 
    about.tags="field::biology, field::biology:bioinformatics, implemented-in::c++,:commandline, role::program, scope::suite, use::analysing,:comparing,:converting,:filtering,:biological-sequence" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y bedtools || apt-get install -y bedtools) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
