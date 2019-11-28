FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="freebayes" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="freebayes" \ 
    about.summary="Bayesian haplotype-based polymorphism discovery and genotyping" \ 
    about.home="https://github.com/ekg/freebayes" \ 
    software.version="1.2.0-2-deb" \ 
    upstream.version="1.2.0" \ 
    version="1" \ 
    extra.identifiers.biotools="freebayes" \ 
    about.copyright="2010-2014 Erik Garrison, Gabor Marth" \ 
    about.license="MIT" \ 
    about.license_file="/usr/share/doc/freebayes/copyright" \ 
    extra.binaries="/usr/bin/bamleftalign,/usr/bin/freebayes" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y freebayes || apt-get install -y freebayes) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
