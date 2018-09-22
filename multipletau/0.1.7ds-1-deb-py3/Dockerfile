FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="multipletau" \ 
    container="multipletau" \ 
    about.summary="multiple-tau algorithm for Python3/NumPy" \ 
    about.home="http://paulmueller.github.io/multipletau" \ 
    software.version="0.1.7ds-1-deb-py3" \ 
    version="1" \ 
    about.copyright="2014 Paul Mueller <paul.mueller@biotec.tu-dresden.de>" \ 
    about.license="BSD-3-Clause" \ 
    about.license_file="/usr/share/doc/multipletau/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y python3-multipletau && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
