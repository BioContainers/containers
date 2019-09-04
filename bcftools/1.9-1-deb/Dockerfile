FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="bcftools" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="bcftools" \ 
    about.summary="genomic variant calling and manipulation of VCF/BCF files" \ 
    about.home="http://samtools.github.io/bcftools/" \ 
    software.version="1.9-1-deb" \ 
    upstream.version="1.9" \ 
    version="1" \ 
    extra.identifiers.biotools="bcftools" \ 
    about.copyright="" \ 
    about.license="MIT or GPL-3.0" \ 
    about.license_file="/usr/share/doc/bcftools/copyright" \ 
    extra.binaries="/usr/bin/bcftools,/usr/bin/color-chrs.pl,/usr/bin/guess-ploidy.py,/usr/bin/plot-roh.py,/usr/bin/plot-vcfstats,/usr/bin/run-roh.pl,/usr/bin/vcfutils.pl" \ 
    about.tags="implemented-in::c, role::program" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y bcftools || apt-get install -y bcftools) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
