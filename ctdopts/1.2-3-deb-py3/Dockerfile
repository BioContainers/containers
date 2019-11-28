FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="ctdopts" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="ctdopts" \ 
    about.summary="Gives your Python tools a CTD-compatible interface" \ 
    about.home="https://github.com/WorkflowConversion/CTDopts" \ 
    software.version="1.2-3-deb-py3" \ 
    upstream.version="1.2" \ 
    version="1" \ 
    about.copyright=" 2012-2017 Andras Szolek" \ 
    about.license="GPL-3" \ 
    about.license_file="/usr/share/doc/ctdopts/copyright" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y python3-ctdopts || apt-get install -y python3-ctdopts) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
