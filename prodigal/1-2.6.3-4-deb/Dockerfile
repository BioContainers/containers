FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="prodigal" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="prodigal" \ 
    about.summary="Microbial (bacterial and archaeal) gene finding program" \ 
    about.home="http://prodigal.ornl.gov/" \ 
    software.version="1-2.6.3-4-deb" \ 
    version="1" \ 
    about.copyright="2007-2011 University of Tennessee / UT-Battelle" \ 
    about.license="GPL-3" \ 
    about.license_file="/usr/share/doc/prodigal/copyright" \ 
    extra.binaries="/usr/bin/prodigal" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y prodigal || apt-get install -y prodigal) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
