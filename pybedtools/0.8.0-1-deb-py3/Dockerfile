FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="pybedtools" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="pybedtools" \ 
    about.summary="Python 3 wrapper around BEDTools for bioinformatics work" \ 
    about.home="https://daler.github.io/pybedtools/" \ 
    software.version="0.8.0-1-deb-py3" \ 
    upstream.version="0.8.0" \ 
    version="1" \ 
    about.copyright="2010-2015 Ryan Dale" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/pybedtools/copyright" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y python3-pybedtools || apt-get install -y python3-pybedtools) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
