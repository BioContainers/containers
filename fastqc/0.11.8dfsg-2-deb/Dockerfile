FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="fastqc" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="fastqc" \ 
    about.summary="quality control for high throughput sequence data" \ 
    about.home="http://www.bioinformatics.babraham.ac.uk/projects/fastqc/" \ 
    software.version="0.11.8dfsg-2-deb" \ 
    upstream.version="0.11.8" \ 
    version="1" \ 
    extra.identifiers.biotools="fastqc" \ 
    about.copyright="Simon Adrews <simon.andrews@bbsrc.ac.uk>" \ 
    about.license="GPL-3.0+" \ 
    about.license_file="/usr/share/doc/fastqc/copyright" \ 
    extra.binaries="/usr/bin/fastqc" \ 
    about.tags="interface::graphical, interface::x11, role::program" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y fastqc || apt-get install -y fastqc) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
