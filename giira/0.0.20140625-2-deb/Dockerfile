FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="giira" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="giira" \ 
    about.summary="RNA-Seq driven gene finding incorporating ambiguous reads" \ 
    about.home="http://sourceforge.net/projects/giira/" \ 
    software.version="0.0.20140625-2-deb" \ 
    upstream.version="0.0.20140625" \ 
    version="1" \ 
    extra.identifiers.biotools="giira" \ 
    about.copyright="2013 Franziska Zickmann <ZickmannF@rki.de>" \ 
    about.license="GPL-3" \ 
    about.license_file="/usr/share/doc/giira/copyright" \ 
    extra.binaries="/usr/bin/giira" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y giira || apt-get install -y giira) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
