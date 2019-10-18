FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="mrbayes" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="mrbayes" \ 
    about.summary="Bayesian Inference of Phylogeny" \ 
    about.home="http://mrbayes.csit.fsu.edu/" \ 
    software.version="3.2.6dfsg-2b1-deb" \ 
    upstream.version="3.2.6" \ 
    version="1" \ 
    about.license="custom, see /usr/share/doc/mrbayes/copyright" \ 
    about.license_file="/usr/share/doc/mrbayes/copyright" \ 
    extra.binaries="/usr/bin/mb" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y mrbayes || apt-get install -y mrbayes) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
