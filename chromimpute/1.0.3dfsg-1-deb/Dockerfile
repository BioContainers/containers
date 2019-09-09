FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="chromimpute" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="chromimpute" \ 
    about.summary="Large-scale systematic epigenome imputation" \ 
    about.home="http://www.biolchem.ucla.edu/labs/ernst/ChromImpute/" \ 
    software.version="1.0.3dfsg-1-deb" \ 
    upstream.version="1.0.3" \ 
    version="1" \ 
    about.copyright="2015 - 2018 Jason Ernst and Manolis Kellis" \ 
    about.license="GPL-2" \ 
    about.license_file="/usr/share/doc/chromimpute/copyright" \ 
    extra.binaries="/usr/bin/ChromImpute" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y chromimpute || apt-get install -y chromimpute) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
