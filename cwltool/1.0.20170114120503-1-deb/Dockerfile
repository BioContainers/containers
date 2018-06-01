FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="cwltool" \ 
    container="cwltool" \ 
    about.summary="Common workflow language reference implementation" \ 
    about.home="http://www.commonwl.org" \ 
    software.version="1.0.20170114120503-1-deb" \ 
    version="1" \ 
    about.copyright="No copyright declared" \ 
    about.license="Apache-2.0" \ 
    about.license_file="/usr/share/doc/cwltool/copyright" \ 
    extra.binaries="/usr/bin/cwltool" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y cwltool && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
