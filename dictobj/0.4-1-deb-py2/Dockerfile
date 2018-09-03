FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="dictobj" \ 
    container="dictobj" \ 
    about.summary="Dictionary where keys can be accessed as instance attributes" \ 
    about.home="http://pypi.python.org/pypi/dictobj" \ 
    software.version="0.4-1-deb-py2" \ 
    version="1" \ 
    about.copyright="2012-2016 William Grim " \ 
    about.license="Apache 2.0" \ 
    about.license_file="/usr/share/doc/dictobj/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y python-dictobj && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
