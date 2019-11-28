FROM biocontainers/biocontainers:debian-stretch-backports_cv2
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="scoary" \ 
    base_image="biocontainers/biocontainers:debian-stretch-backports_cv2" \ 
    container="scoary" \ 
    about.summary="pangenome-wide association studies" \ 
    about.home="https://github.com/AdmiralenOla/Scoary" \ 
    software.version="1.6.16-1bpo91-deb" \ 
    upstream.version="1.6.16" \ 
    version="2" \ 
    extra.identifiers.biotools="scoary" \ 
    about.license="custom, see /usr/share/doc/scoary/copyright" \ 
    about.license_file="/usr/share/doc/scoary/copyright" \ 
    extra.binaries="/usr/bin/scoary,/usr/bin/scoary_GUI,/usr/bin/vcf2scoary" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -t stretch-backports -y scoary && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
