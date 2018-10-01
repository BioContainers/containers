FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="pilon" \ 
    container="pilon" \ 
    base_image="biocontainers/biocontainers:debian-stretch-backports" \
    about.summary="automated genome assembly improvement and variant detection tool" \ 
    about.home="https://github.com/broadinstitute/pilon/wiki" \ 
    software.version="1.22dfsg-1bpo91-deb" \ 
    version="1" \ 
    extra.identifiers.biotools="pilon" \ 
    about.license="custom, see /usr/share/doc/pilon/copyright" \
    about.license_file="/usr/share/doc/pilon/copyright" \ 
    extra.binaries="/usr/bin/pilon" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y pilon && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
