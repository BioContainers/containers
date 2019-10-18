FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="piler" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="piler" \ 
    about.summary="genomic repeat analysis" \ 
    about.home="http://www.drive5.com/piler/" \ 
    software.version="020140707-2-deb" \ 
    version="1" \ 
    about.copyright="Robert Edgar" \ 
    about.license="PublicDomain" \ 
    about.license_file="/usr/share/doc/piler/copyright" \ 
    extra.binaries="/usr/bin/piler2" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y piler || apt-get install -y piler) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
