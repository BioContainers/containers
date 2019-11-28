FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="rdp-classifier" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="rdp-classifier" \ 
    about.summary="extensible sequence classifier for fungal lsu, bacterial and archaeal 16s" \ 
    about.home="https://github.com/rdpstaff/classifier" \ 
    software.version="2.10.2-4-deb" \ 
    upstream.version="2.10.2" \ 
    version="1" \ 
    about.copyright="2008-2014 Michigan State University Board of Trustees <rdpstaff@msu.edu>" \ 
    about.license="GPL-2.0+" \ 
    about.license_file="/usr/share/doc/rdp-classifier/copyright" \ 
    extra.binaries="/usr/bin/rdp_classifier" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y rdp-classifier || apt-get install -y rdp-classifier) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
