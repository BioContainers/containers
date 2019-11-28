FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="clonalframeml" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="clonalframeml" \ 
    about.summary="Efficient Inference of Recombination in Whole Bacterial Genomes" \ 
    about.home="https://github.com/xavierdidelot/ClonalFrameML" \ 
    software.version="1.11-3-deb" \ 
    upstream.version="1.11" \ 
    version="1" \ 
    about.copyright="2013-2017" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/clonalframeml/copyright" \ 
    extra.binaries="/usr/bin/ClonalFrameML" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y clonalframeml || apt-get install -y clonalframeml) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
