FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="bolt-lmm" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="bolt-lmm" \ 
    about.summary="Efficient large cohorts genome-wide Bayesian mixed-model association testing" \ 
    about.home="https://data.broadinstitute.org/alkesgroup/BOLT-LMM/" \ 
    software.version="2.3.2dfsg-3b1-deb" \ 
    upstream.version="2.3.2" \ 
    version="1" \ 
    about.license="custom, see /usr/share/doc/bolt-lmm/copyright" \ 
    about.license_file="/usr/share/doc/bolt-lmm/copyright" \ 
    extra.binaries="/usr/bin/bolt" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y bolt-lmm || apt-get install -y bolt-lmm) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
