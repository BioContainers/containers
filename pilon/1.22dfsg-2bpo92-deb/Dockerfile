FROM biocontainers/biocontainers:debian-stretch-backports_cv2
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="pilon" \ 
    base_image="biocontainers/biocontainers:debian-stretch-backports_cv2" \ 
    container="pilon" \ 
    about.summary="automated genome assembly improvement and variant detection tool" \ 
    about.home="https://github.com/broadinstitute/pilon/wiki" \ 
    software.version="1.22dfsg-2bpo92-deb" \ 
    upstream.version="1.22" \ 
    version="1" \ 
    extra.identifiers.biotools="pilon" \ 
    about.license="custom, see /usr/share/doc/pilon/copyright" \ 
    about.license_file="/usr/share/doc/pilon/copyright" \ 
    extra.binaries="/usr/bin/pilon" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y pilon && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
