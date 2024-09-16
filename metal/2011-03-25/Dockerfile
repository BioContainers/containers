FROM debian:bullseye-slim


LABEL    software="Metal" \ 
    MAINTAINER="Sebastian Bassi <sebastian@toyoko.io>" \
    base_image="debian:bullseye-slim" \ 
    about.summary="METAL is designed to facilitate meta-analysis of large datasets (such as several whole genome scans)" \ 
    about.home="https://csg.sph.umich.edu/abecasis/Metal/index.html" \ 
    software.version="2011-03-25" \ 
    upstream.version="2011-03-25" \ 
    about.copyright="1992-2010 Sean R. Eddy <eddy@genetics.wustl.edu>" \ 
    about.license="GPL-3" \ 
    about.license_file="/usr/share/doc/hmmer/copyright" \ 
    extra.binaries="/usr/local/bin/metal" \ 
    about.tags="biology::format:aln, biology::peptidic, field::biology,:biology:bioinformatics, implemented-in::c,:commandline, role::program, scope::utility, use::searching,:plaintext, works-with::db" 


USER root
ENV DEBIAN_FRONTEND noninteractive

RUN apt update && apt install -y build-essential wget libz-dev && apt clean && apt purge && rm -rf /var/lib/apt/lists/* /tmp/*

RUN wget https://csg.sph.umich.edu/abecasis/Metal/download/generic-metal-2011-03-25.tar.gz 
RUN tar xvfz generic-metal-2011-03-25.tar.gz && rm generic-metal-2011-03-25.tar.gz
COPY Makefile .

RUN cd generic-metal && make all && make install


