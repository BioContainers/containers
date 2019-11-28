FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="scoary" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="scoary" \ 
    about.summary="pangenome-wide association studies" \ 
    about.home="https://github.com/AdmiralenOla/Scoary" \ 
    software.version="1.6.16-1-deb" \ 
    upstream.version="1.6.16" \ 
    version="1" \ 
    extra.identifiers.biotools="scoary" \ 
    about.copyright="2016-2017 Ola Brynildsrud <ola.brynildsrud@fhi.no>" \ 
    about.license="GPL-3.0" \ 
    about.license_file="/usr/share/doc/scoary/copyright" \ 
    extra.binaries="/usr/bin/scoary,/usr/bin/scoary_GUI,/usr/bin/vcf2scoary" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y scoary || apt-get install -y scoary) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
