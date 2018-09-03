FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="profnet-bval" \ 
    container="profnet-bval" \ 
    about.summary="neural network architecture for profbval" \ 
    about.home="http://www.predictprotein.org/" \ 
    software.version="1.0.22-4-deb" \ 
    version="1" \ 
    about.copyright="" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/profnet-bval/copyright" \ 
    extra.binaries="/usr/bin/profnet_bval" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y profnet-bval && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
