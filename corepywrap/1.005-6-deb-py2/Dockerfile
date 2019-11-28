FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="corepywrap" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="corepywrap" \ 
    about.summary="library that exports C++ mmCIF accessors to Python" \ 
    about.home="http://sw-tools.rcsb.org/apps/CORE-WRAPPER/index.html" \ 
    software.version="1.005-6-deb-py2" \ 
    upstream.version="1.005" \ 
    version="1" \ 
    about.license="custom, see /usr/share/doc/corepywrap/copyright" \ 
    about.license_file="/usr/share/doc/corepywrap/copyright" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y python-corepywrap || apt-get install -y python-corepywrap) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
