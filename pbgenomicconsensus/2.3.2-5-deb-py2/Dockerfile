FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="pbgenomicconsensus" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="pbgenomicconsensus" \ 
    about.summary="Pacific Biosciences variant and consensus caller (Python 2)" \ 
    about.home="https://github.com/PacificBiosciences/GenomicConsensus" \ 
    software.version="2.3.2-5-deb-py2" \ 
    upstream.version="2.3.2" \ 
    version="1" \ 
    about.copyright="2011-2018 Pacific Biosciences of California, Inc. <devnet@pacificbiosciences.com>" \ 
    about.license="PacBio-BSD-3-Clause" \ 
    about.license_file="/usr/share/doc/pbgenomicconsensus/copyright" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y python-pbgenomicconsensus || apt-get install -y python-pbgenomicconsensus) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
