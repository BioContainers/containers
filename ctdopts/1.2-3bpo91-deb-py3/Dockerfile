FROM biocontainers/biocontainers:debian-stretch-backports_cv2
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="ctdopts" \ 
    base_image="biocontainers/biocontainers:debian-stretch-backports_cv2" \ 
    container="ctdopts" \ 
    about.summary="Gives your Python tools a CTD-compatible interface" \ 
    about.home="https://github.com/WorkflowConversion/CTDopts" \ 
    software.version="1.2-3bpo91-deb-py3" \ 
    upstream.version="1.2" \ 
    version="1" \ 
    about.license="custom, see /usr/share/doc/ctdopts/copyright" \ 
    about.license_file="/usr/share/doc/ctdopts/copyright" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y python3-ctdopts && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
