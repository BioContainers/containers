FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="fastcluster" \ 
    container="fastcluster" \ 
    about.summary="Fast hierarchical clustering routines for Python 3" \ 
    about.home="https://cran.r-project.org/package=fastcluster" \ 
    software.version="1.1.22-1-deb-py3" \ 
    version="1" \ 
    about.copyright="2011-2016 Daniel Mllner <muellner at math.stanford.edu>" \ 
    about.license="BSDlike" \ 
    about.license_file="/usr/share/doc/fastcluster/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y python3-fastcluster && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
