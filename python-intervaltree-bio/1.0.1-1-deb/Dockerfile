FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="python-intervaltree-bio" \ 
    container="python-intervaltree-bio" \ 
    about.summary="Interval tree convenience classes for genomic data -- Python 2 library" \ 
    about.home="https://github.com/konstantint/intervaltree-bio" \ 
    software.version="1.0.1-1-deb" \ 
    version="1" \ 
    about.copyright="2014-2015 Konstantin Tretyakov <kt@ut.ee>" \ 
    about.license="MIT" \ 
    about.license_file="/usr/share/doc/python-intervaltree-bio/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y python-intervaltree-bio && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
