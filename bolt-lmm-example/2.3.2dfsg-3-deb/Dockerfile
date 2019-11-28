FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="bolt-lmm-example" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="bolt-lmm-example" \ 
    about.summary="Examples for bolt-lmm" \ 
    about.home="https://data.broadinstitute.org/alkesgroup/BOLT-LMM/" \ 
    software.version="2.3.2dfsg-3-deb" \ 
    upstream.version="2.3.2" \ 
    version="1" \ 
    about.copyright="2014-2018 Harvard University, Po-Ru Loh" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/bolt-lmm-example/copyright" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y bolt-lmm-example || apt-get install -y bolt-lmm-example) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
