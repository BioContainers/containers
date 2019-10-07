FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="maffilter" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="maffilter" \ 
    about.summary="process genome alignment in the Multiple Alignment Format" \ 
    about.home="https://jydu.github.io/maffilter/" \ 
    software.version="1.3.1dfsg-1b1-deb" \ 
    upstream.version="1.3.1" \ 
    version="1" \ 
    about.license="custom, see /usr/share/doc/maffilter/copyright" \ 
    about.license_file="/usr/share/doc/maffilter/copyright" \ 
    extra.binaries="/usr/bin/maffilter" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y maffilter || apt-get install -y maffilter) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
