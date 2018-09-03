FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="norsp" \ 
    container="norsp" \ 
    about.summary="predictor of non-regular secondary structure" \ 
    about.home="https://rostlab.org/owiki/index.php/NORSp_-_predictor_of_NOn-Regular_Secondary_Structure" \ 
    software.version="1.0.6-2-deb" \ 
    version="1" \ 
    extra.identifiers.biotools="norsp" \ 
    about.copyright="2003 Jinfeng Liu <jinfeng.liu@gmail.com>" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/norsp/copyright" \ 
    extra.binaries="/usr/bin/norsp" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y norsp && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
