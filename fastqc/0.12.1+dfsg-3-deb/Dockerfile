FROM debian:trixie-slim
MAINTAINER Sebastian Bassi <sebastian@toyoko.io>
LABEL    software="fastqc" \ 
    base_image="debian:trixie-slim" \ 
    container="fastqc" \ 
    about.summary="quality control for high throughput sequence data" \ 
    about.home="http://www.bioinformatics.babraham.ac.uk/projects/fastqc/" \ 
    software.version="0.12.1dfsg-3-deb" \ 
    upstream.version="0.12.1" \ 
    version="1" \ 
    extra.identifiers.biotools="fastqc" \ 
    about.copyright="Simon Adrews <simon.andrews@bbsrc.ac.uk>" \ 
    about.license="GPL-3.0+" \ 
    about.license_file="/usr/share/doc/fastqc/copyright" \ 
    extra.binaries="/usr/bin/fastqc" \ 
    about.tags="interface::graphical, interface::x11, role::program" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y fastqc=0.12.1 && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
