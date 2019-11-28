FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="raxml" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="raxml" \ 
    about.summary="Randomized Axelerated Maximum Likelihood of phylogenetic trees" \ 
    about.home="http://www.exelixis-lab.org/" \ 
    software.version="8.2.12dfsg-1-deb" \ 
    upstream.version="8.2.12" \ 
    version="1" \ 
    extra.identifiers.biotools="raxml" \ 
    about.copyright=" 2006-2017 Alexandros Stamatakis" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/raxml/copyright" \ 
    extra.binaries="/usr/bin/raxmlHPC,/usr/bin/raxmlHPC-PTHREADS,/usr/bin/raxmlHPC-PTHREADS-AVX,/usr/bin/raxmlHPC-PTHREADS-SSE3" \ 
    about.tags="field::biology, role::program" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y raxml || apt-get install -y raxml) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
