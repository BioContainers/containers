FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="hinge" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="hinge" \ 
    about.summary="long read genome assembler based on hinging" \ 
    about.home="https://github.com/HingeAssembler/HINGE" \ 
    software.version="0.5.0-4-deb" \ 
    upstream.version="0.5.0" \ 
    version="1" \ 
    about.copyright="2016 Govinda Kamath" \ 
    about.license="BSD-3-Clause/HINGE" \ 
    about.license_file="/usr/share/doc/hinge/copyright" \ 
    extra.binaries="/usr/bin/hinge" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y hinge || apt-get install -y hinge) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
