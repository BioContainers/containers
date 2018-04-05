FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="pyscanfcs" \ 
    container="pyscanfcs" \ 
    about.summary="scientific tool for perpendicular line scanning FCS" \ 
    about.home="http://pyscanfcs.craban.de" \ 
    software.version="0.2.3-3-deb" \ 
    version="1" \ 
    about.copyright="2013 Paul Mueller <paul.mueller@biotec.tu-dresden.de>" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/pyscanfcs/copyright" \ 
    extra.binaries="/usr/bin/pyscanfcs" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y pyscanfcs && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
