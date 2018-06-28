FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="raxml" \ 
    container="raxml" \ 
    about.summary="Randomized Axelerated Maximum Likelihood of phylogenetic trees" \ 
    about.home="http://www.exelixis-lab.org/" \ 
    software.version="8.2.9dfsg-1b1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/raxml/copyright" \ 
    extra.binaries="/usr/bin/raxmlHPC,/usr/bin/raxmlHPC-PTHREADS,/usr/bin/raxmlHPC-PTHREADS-AVX,/usr/bin/raxmlHPC-PTHREADS-SSE3" \ 
    about.tags="field::biology, role::program" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y raxml && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
