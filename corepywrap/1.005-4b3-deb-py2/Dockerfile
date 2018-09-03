FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="corepywrap" \ 
    container="corepywrap" \ 
    about.summary="library that exports C++ mmCIF accessors to Python" \ 
    about.home="http://sw-tools.rcsb.org/apps/CORE-WRAPPER/index.html" \ 
    software.version="1.005-4b3-deb-py2" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/corepywrap/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y python-corepywrap && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
