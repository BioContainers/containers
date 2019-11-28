FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="dwgsim" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="dwgsim" \ 
    about.summary="short sequencing read simulator" \ 
    about.home="https://github.com/nh13/DWGSIM/" \ 
    software.version="0.1.12-2-deb" \ 
    upstream.version="0.1.12" \ 
    version="1" \ 
    about.copyright="2008 Genome Research Ltd" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/dwgsim/copyright" \ 
    extra.binaries="/usr/bin/dwgsim" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y dwgsim || apt-get install -y dwgsim) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
