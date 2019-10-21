FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="sim4" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="sim4" \ 
    about.summary="tool for aligning cDNA and genomic DNA" \ 
    about.home="http://globin.bx.psu.edu/html/docs/sim4.html" \ 
    software.version="0.0.20121010-5-deb" \ 
    upstream.version="0.0.20121010" \ 
    version="1" \ 
    extra.identifiers.biotools="sim4" \ 
    about.copyright=" 1998-2012 Liliana Florea <florea@gwu.edu>," \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/sim4/copyright" \ 
    extra.binaries="/usr/bin/sim4" \ 
    about.tags="field::biology, field::biology:bioinformatics, implemented-in::c,:commandline, role::program, scope::utility, use::comparing,:searching, works-with-format::TODO, works-with-format::plaintext,:TODO" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y sim4 || apt-get install -y sim4) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
