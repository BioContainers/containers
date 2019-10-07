FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="logol" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="logol" \ 
    about.summary="Pattern matching tool using Logol language" \ 
    about.home="http://logol.genouest.org" \ 
    software.version="1.7.9-1-deb" \ 
    upstream.version="1.7.9" \ 
    version="1" \ 
    extra.identifiers.biotools="logol" \ 
    about.copyright="2015 Olivier Sallou <olivier.sallou@irisa.fr>" \ 
    about.license="AGPL-3.0+" \ 
    about.license_file="/usr/share/doc/logol/copyright" \ 
    extra.binaries="/usr/bin/LogolExec,/usr/bin/LogolMultiExec" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y logol || apt-get install -y logol) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
