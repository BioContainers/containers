FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="freebayes" \ 
    base_image="biocontainers/biocontainers:debian-stretch-backports" \
    container="freebayes" \ 
    about.summary="Bayesian haplotype-based polymorphism discovery and genotyping" \ 
    about.home="https://github.com/ekg/freebayes" \ 
    software.version="1.2.0-1bpo91-deb" \ 
    version="1" \ 
    extra.identifiers.biotools="freebayes" \ 
    about.license="custom, see /usr/share/doc/freebayes/copyright" \
    about.license_file="/usr/share/doc/freebayes/copyright" \ 
    extra.binaries="/usr/bin/bamleftalign,/usr/bin/freebayes" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y freebayes && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
