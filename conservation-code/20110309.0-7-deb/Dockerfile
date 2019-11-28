FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="conservation-code" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="conservation-code" \ 
    about.summary="protein sequence conservation scoring tool" \ 
    about.home="http://compbio.cs.princeton.edu/conservation/" \ 
    software.version="20110309.0-7-deb" \ 
    upstream.version="20110309.0" \ 
    version="1" \ 
    about.copyright="Tony Capra 2007" \ 
    about.license="GPL-2.0+" \ 
    about.license_file="/usr/share/doc/conservation-code/copyright" \ 
    extra.binaries="/usr/bin/score_conservation" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y conservation-code || apt-get install -y conservation-code) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
