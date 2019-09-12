FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="cyvcf2" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="cyvcf2" \ 
    about.summary="VCF parser based on htslib (Python 2)" \ 
    about.home="https://github.com/brentp/cyvcf2" \ 
    software.version="0.10.4-1-deb-py2" \ 
    upstream.version="0.10.4" \ 
    version="1" \ 
    extra.identifiers.biotools="cyvcf2" \ 
    about.copyright="2015 Brent Pedersen" \ 
    about.license="MIT" \ 
    about.license_file="/usr/share/doc/cyvcf2/copyright" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y python-cyvcf2 || apt-get install -y python-cyvcf2) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
