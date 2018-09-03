FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="dnaclust" \ 
    container="dnaclust" \ 
    about.summary="tool for clustering millions of short DNA sequences" \ 
    about.home="http://dnaclust.sourceforge.net/" \ 
    software.version="3-4b2-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/dnaclust/copyright" \ 
    extra.binaries="/usr/bin/dnaclust,/usr/bin/dnaclust-abun,/usr/bin/dnaclust-ref,/usr/bin/find-large-clusters,/usr/bin/generate_test_clusters,/usr/bin/star-align" \ 
    about.tags="biology::format:fasta, biology::nucleic-acids, field::biology,:biology:bioinformatics, implemented-in::c++, role::program,:biological-sequence" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y dnaclust && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
