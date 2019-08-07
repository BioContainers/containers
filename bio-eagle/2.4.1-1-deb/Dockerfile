FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="bio-eagle" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="bio-eagle" \ 
    about.summary="Haplotype phasing within a genotyped cohort or using a phased reference panel" \ 
    about.home="https://data.broadinstitute.org/alkesgroup/Eagle/" \ 
    software.version="2.4.1-1-deb" \ 
    upstream.version="2.4.1" \ 
    version="1" \ 
    about.copyright="2015-2017 Harvard University, Po-Ru Loh" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/bio-eagle/copyright" \ 
    extra.binaries="/usr/bin/bio-eagle" \ 
    about.tags="field::biology, field::biology:bioinformatics, implemented-in::c++,:commandline, role::program, use::analysing" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y bio-eagle || apt-get install -y bio-eagle) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
