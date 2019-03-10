FROM biocontainers/biocontainers:debian-stretch-backports_cv2
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="ctdconverter" \ 
    base_image="biocontainers/biocontainers:debian-stretch-backports_cv2" \ 
    container="ctdconverter" \ 
    about.summary="Convert CTD files into Galaxy tool and CWL CommandLineTool files" \ 
    about.home="https://github.com/WorkflowConversion/CTDConverter" \ 
    software.version="2.0-4bpo91-deb" \ 
    upstream.version="2.0" \ 
    version="1" \ 
    about.license="custom, see /usr/share/doc/ctdconverter/copyright" \ 
    about.license_file="/usr/share/doc/ctdconverter/copyright" \ 
    extra.binaries="/usr/bin/CTDConverter" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y ctdconverter && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
