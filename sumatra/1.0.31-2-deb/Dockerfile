FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="sumatra" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="sumatra" \ 
    about.summary="fast and exact comparison and clustering of sequences" \ 
    about.home="http://metabarcoding.org/sumatra" \ 
    software.version="1.0.31-2-deb" \ 
    upstream.version="1.0.31" \ 
    version="1" \ 
    about.copyright="2013-2015 Tiayyba Riaz" \ 
    about.license="CeCILL-2" \ 
    about.license_file="/usr/share/doc/sumatra/copyright" \ 
    extra.binaries="/usr/bin/sumatra" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y sumatra || apt-get install -y sumatra) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
