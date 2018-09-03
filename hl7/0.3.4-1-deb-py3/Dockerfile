FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="hl7" \ 
    container="hl7" \ 
    about.summary="Python3 library for parsing HL7 messages" \ 
    about.home="https://github.com/johnpaulett/python-hl7/" \ 
    software.version="0.3.4-1-deb-py3" \ 
    version="1" \ 
    about.copyright="2009-2014 John Paulett <john@paulett.org>" \ 
    about.license="BSD-3-clause" \ 
    about.license_file="/usr/share/doc/hl7/copyright" \ 
    extra.binaries="/usr/bin/mllp_send" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y python3-hl7 && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
