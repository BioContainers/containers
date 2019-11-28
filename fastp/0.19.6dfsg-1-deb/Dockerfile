FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="fastp" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="fastp" \ 
    about.summary="Ultra-fast all-in-one FASTQ preprocessor" \ 
    about.home="https://github.com/OpenGene/fastp" \ 
    software.version="0.19.6dfsg-1-deb" \ 
    upstream.version="0.19.6" \ 
    version="1" \ 
    about.copyright="2017-2018 Shifu Chen, Yanqing Zhou, Yaru Chen, Jia Gu, OpenGene - Open Source Genetics Toolbox" \ 
    about.license="Expat" \ 
    about.license_file="/usr/share/doc/fastp/copyright" \ 
    extra.binaries="/usr/bin/fastp" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y fastp || apt-get install -y fastp) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
