FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="dssp" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="dssp" \ 
    about.summary="protein secondary structure assignment based on 3D structure" \ 
    about.home="http://www.cmbi.ru.nl/dssp.html" \ 
    software.version="3.0.0-3b1-deb" \ 
    upstream.version="3.0.0" \ 
    version="1" \ 
    about.license="custom, see /usr/share/doc/dssp/copyright" \ 
    about.license_file="/usr/share/doc/dssp/copyright" \ 
    extra.binaries="/usr/bin/dssp,/usr/bin/mkdssp" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y dssp || apt-get install -y dssp) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
