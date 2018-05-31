FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="bcftools" \ 
    container="bcftools" \ 
    about.summary="genomic variant calling and manipulation of VCF/BCF files" \ 
    about.home="http://samtools.github.io/bcftools/" \ 
    software.version="1.3.1-1b1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/bcftools/copyright" \ 
    extra.binaries="/usr/bin/bcftools,/usr/bin/color-chrs.pl,/usr/bin/guess-ploidy.py,/usr/bin/plot-roh.py,/usr/bin/plot-vcfstats,/usr/bin/run-roh.pl,/usr/bin/vcfutils.pl" \ 
    about.tags="implemented-in::c, role::program" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y bcftools && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
