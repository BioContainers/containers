FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="discosnp" \ 
    container="discosnp" \ 
    about.summary="discovering Single Nucleotide Polymorphism from raw set(s) of reads" \ 
    about.home="http://colibread.inria.fr/discosnp/" \ 
    software.version="1.2.6-1b2-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/discosnp/copyright" \ 
    extra.binaries="/usr/bin/discoSnp_to_csv,/usr/bin/discoSnp_to_genotypes,/usr/bin/kissnp2,/usr/bin/kissreads" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y discosnp && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
