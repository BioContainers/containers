FROM biocontainers/biocontainers:debian-stretch-backports_cv2
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="psortb" \ 
    base_image="biocontainers/biocontainers:debian-stretch-backports_cv2" \ 
    container="psortb" \ 
    about.summary="bacterial localization prediction tool" \ 
    about.home="http://www.psort.org/" \ 
    software.version="3.0.6dfsg-1bpo91-deb" \ 
    upstream.version="3.0.6" \ 
    version="1" \ 
    extra.identifiers.biotools="psortb" \ 
    about.license="custom, see /usr/share/doc/psortb/copyright" \ 
    about.license_file="/usr/share/doc/psortb/copyright" \ 
    extra.binaries="/usr/bin/psort" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y psortb && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
