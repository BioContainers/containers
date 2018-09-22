FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="biom-format" \ 
    container="biom-format" \ 
    about.summary="Biological Observation Matrix (BIOM) format (Python 3)" \ 
    about.home="http://biom-format.org/" \ 
    software.version="2.1.5dfsg-7-deb-py3" \ 
    version="1" \ 
    about.copyright=" 2010-2015 Greg Caporaso <gregcaporaso@gmail.com>" \ 
    about.license="GPL" \ 
    about.license_file="/usr/share/doc/biom-format/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y python3-biom-format && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
