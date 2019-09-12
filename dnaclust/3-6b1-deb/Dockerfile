FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="dnaclust" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="dnaclust" \ 
    about.summary="tool for clustering millions of short DNA sequences" \ 
    about.home="http://dnaclust.sourceforge.net/" \ 
    software.version="3-6b1-deb" \ 
    upstream.version="3" \ 
    version="1" \ 
    about.license="custom, see /usr/share/doc/dnaclust/copyright" \ 
    about.license_file="/usr/share/doc/dnaclust/copyright" \ 
    extra.binaries="/usr/bin/dnaclust,/usr/bin/dnaclust-abun,/usr/bin/dnaclust-ref,/usr/bin/find-large-clusters,/usr/bin/generate_test_clusters,/usr/bin/star-align" \ 
    about.tags="biology::format:fasta, biology::nucleic-acids, field::biology,:biology:bioinformatics, implemented-in::c++, role::program,:biological-sequence" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y dnaclust || apt-get install -y dnaclust) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
