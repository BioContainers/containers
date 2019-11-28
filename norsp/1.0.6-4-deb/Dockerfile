FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="norsp" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="norsp" \ 
    about.summary="predictor of non-regular secondary structure" \ 
    about.home="https://rostlab.org/owiki/index.php/NORSp_-_predictor_of_NOn-Regular_Secondary_Structure" \ 
    software.version="1.0.6-4-deb" \ 
    upstream.version="1.0.6" \ 
    version="1" \ 
    extra.identifiers.biotools="norsp" \ 
    about.copyright="2003 Jinfeng Liu <jinfeng.liu@gmail.com>" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/norsp/copyright" \ 
    extra.binaries="/usr/bin/norsp" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y norsp || apt-get install -y norsp) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
