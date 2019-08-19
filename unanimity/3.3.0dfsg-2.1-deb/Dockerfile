FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="unanimity" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="unanimity" \ 
    about.summary="generate and process accurate consensus nucleotide sequences" \ 
    about.home="https://github.com/PacificBiosciences/unanimity" \ 
    software.version="3.3.0dfsg-2.1-deb" \ 
    upstream.version="3.3.0" \ 
    version="1" \ 
    about.copyright="" \ 
    about.license="BSD-3-Clause-PacBio" \ 
    about.license_file="/usr/share/doc/unanimity/copyright" \ 
    extra.binaries="/usr/bin/ccs,/usr/bin/gcpp" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y unanimity || apt-get install -y unanimity) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
