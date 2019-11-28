FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="consensuscore2" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="consensuscore2" \ 
    about.summary="generate consensus sequences for PacBio data -- Python 2" \ 
    about.home="https://github.com/PacificBiosciences/unanimity" \ 
    software.version="3.3.0dfsg-2.1-deb-py2" \ 
    upstream.version="3.3.0" \ 
    version="1" \ 
    about.copyright="" \ 
    about.license="BSD-3-Clause-PacBio" \ 
    about.license_file="/usr/share/doc/consensuscore2/copyright" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y python-consensuscore2 || apt-get install -y python-consensuscore2) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
