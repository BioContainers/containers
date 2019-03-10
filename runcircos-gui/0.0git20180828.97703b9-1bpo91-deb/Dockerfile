FROM biocontainers/biocontainers:debian-stretch-backports_cv2
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="runcircos-gui" \ 
    base_image="biocontainers/biocontainers:debian-stretch-backports_cv2" \ 
    container="runcircos-gui" \ 
    about.summary="GUI tool to run circos" \ 
    about.home="https://github.com/narunlifescience/runcircos-gui" \ 
    software.version="0.0git20180828.97703b9-1bpo91-deb" \ 
    upstream.version="0.0" \ 
    version="2" \ 
    about.license="custom, see /usr/share/doc/runcircos-gui/copyright" \ 
    about.license_file="/usr/share/doc/runcircos-gui/copyright" \ 
    extra.binaries="/usr/bin/runcircos-gui" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -t stretch-backports -y runcircos-gui && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
