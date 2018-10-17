FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="arden" \ 
    container="arden" \ 
    about.summary="specificity control for read alignments using an artificial reference" \ 
    about.home="http://sourceforge.net/projects/arden/" \ 
    software.version="1.0-3-deb" \ 
    version="1" \ 
    about.copyright="2012-2013, Sven H. Giese <gieses@rki.de>" \ 
    about.license="BSDlike" \ 
    about.license_file="/usr/share/doc/arden/copyright" \ 
    extra.binaries="/usr/bin/arden-analyze,/usr/bin/arden-create,/usr/bin/arden-filter" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y arden && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
