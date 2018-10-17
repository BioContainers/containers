FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="bz2file" \ 
    container="bz2file" \ 
    about.summary="Python3 library for reading and writing bzip2-compressed files" \ 
    about.home="https://github.com/nvawda/bz2file" \ 
    software.version="0.98-1-deb-py3" \ 
    version="1" \ 
    about.copyright=" 2012-2015 Nadeem Vawda <nadeem.vawda@gmail.com>" \ 
    about.license="Apache" \ 
    about.license_file="/usr/share/doc/bz2file/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y python3-bz2file && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
