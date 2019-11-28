FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="dindel" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="dindel" \ 
    about.summary="determines indel calls from short-read data" \ 
    about.home="https://github.com/genome/dindel-tgi" \ 
    software.version="1.01-wu1-3dfsg-1b1-deb" \ 
    upstream.version="1.01" \ 
    version="1" \ 
    about.license="custom, see /usr/share/doc/dindel/copyright" \ 
    about.license_file="/usr/share/doc/dindel/copyright" \ 
    extra.binaries="/usr/bin/dindel" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y dindel || apt-get install -y dindel) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
