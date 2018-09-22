FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="dwgsim" \ 
    container="dwgsim" \ 
    about.summary="short sequencing read simulator" \ 
    about.home="https://github.com/nh13/DWGSIM/" \ 
    software.version="0.1.11-3b1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/dwgsim/copyright" \ 
    extra.binaries="/usr/bin/dwgsim" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y dwgsim && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
