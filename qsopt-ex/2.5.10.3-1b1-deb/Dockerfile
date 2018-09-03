FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="qsopt-ex" \ 
    container="qsopt-ex" \ 
    about.summary="Exact linear programming solver" \ 
    about.home="http://www.dii.uchile.cl/~daespino/ESolver_doc/main.html" \ 
    software.version="2.5.10.3-1b1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/qsopt-ex/copyright" \ 
    extra.binaries="/usr/bin/esolver" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y qsopt-ex && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
