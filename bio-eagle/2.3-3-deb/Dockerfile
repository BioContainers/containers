FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="bio-eagle" \ 
    container="bio-eagle" \ 
    about.summary="Haplotype phasing within a genotyped cohort or using a phased reference panel" \ 
    about.home="https://data.broadinstitute.org/alkesgroup/Eagle/" \ 
    software.version="2.3-3-deb" \ 
    version="1" \ 
    about.copyright="2015-2016 Harvard University, Po-Ru Loh" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/bio-eagle/copyright" \ 
    extra.binaries="/usr/bin/bio-eagle" \ 
    about.tags="field::biology, field::biology:bioinformatics, implemented-in::c++,:commandline, role::program, use::analysing" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y bio-eagle && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
