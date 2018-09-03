FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="biom-format-tools" \ 
    container="biom-format-tools" \ 
    about.summary="command-line tools for BIOM format" \ 
    about.home="http://biom-format.org/" \ 
    software.version="2.1.5dfsg-7-deb" \ 
    version="1" \ 
    about.copyright=" 2010-2015 Greg Caporaso <gregcaporaso@gmail.com>" \ 
    about.license="GPL" \ 
    about.license_file="/usr/share/doc/biom-format-tools/copyright" \ 
    extra.binaries="/usr/bin/biom" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y biom-format-tools && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
