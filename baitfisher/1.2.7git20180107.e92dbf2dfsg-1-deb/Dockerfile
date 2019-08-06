FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="baitfisher" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="baitfisher" \ 
    about.summary="software package for designing hybrid enrichment probes" \ 
    about.home="https://github.com/cmayer/BaitFisher-package" \ 
    software.version="1.2.7git20180107.e92dbf2dfsg-1-deb" \ 
    upstream.version="1.2.7" \ 
    version="1" \ 
    about.copyright="2016 Christoph Mayer <c.mayer.zfmk@uni-bonn.de>, Forschungsmuseum Alexander Koenig" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/baitfisher/copyright" \ 
    extra.binaries="/usr/bin/BaitFilter,/usr/bin/BaitFisher" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y baitfisher || apt-get install -y baitfisher) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
