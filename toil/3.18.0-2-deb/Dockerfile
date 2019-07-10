FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="toil" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="toil" \ 
    about.summary="cross-platform workflow engine" \ 
    about.home="https://github.com/BD2KGenomics/toil" \ 
    software.version="3.18.0-2-deb" \ 
    upstream.version="3.18.0" \ 
    version="1" \ 
    about.copyright="Benedict Paten <benedict@soe.usc.edu>" \ 
    about.license="Apache-2.0" \ 
    about.license_file="/usr/share/doc/toil/copyright" \ 
    extra.binaries="/usr/bin/_toil_worker,/usr/bin/toil,/usr/bin/toil-cwl-runner,/usr/bin/toil-wdl-runner" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y toil || apt-get install -y toil) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
