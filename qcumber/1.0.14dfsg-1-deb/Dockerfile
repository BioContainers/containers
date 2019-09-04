FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="qcumber" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="qcumber" \ 
    about.summary="quality control of genomic sequences" \ 
    about.home="https://gitlab.com/RKIBioinformaticsPipelines/QCumber" \ 
    software.version="1.0.14dfsg-1-deb" \ 
    upstream.version="1.0.14" \ 
    version="1" \ 
    about.copyright="2016-2017 Vivi Lieu <LieuV@rki.de>" \ 
    about.license="LGPL-3+" \ 
    about.license_file="/usr/share/doc/qcumber/copyright" \ 
    extra.binaries="/usr/bin/qcumber" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y qcumber || apt-get install -y qcumber) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
