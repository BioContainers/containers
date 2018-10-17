FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="pbhoney" \ 
    container="pbhoney" \ 
    about.summary="genomic structural variation discovery" \ 
    about.home="http://sourceforge.net/projects/pb-jelly" \ 
    software.version="15.8.24dfsg-2-deb" \ 
    version="1" \ 
    about.copyright="2013 Baylor College of Medicine" \ 
    about.license="BSD-2-Clause" \ 
    about.license_file="/usr/share/doc/pbhoney/copyright" \ 
    extra.binaries="/usr/bin/Honey,/usr/bin/Honey.py" \ 
    extra.identifiers.doi="10.1186/1471-2105-15-180" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y pbhoney && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
