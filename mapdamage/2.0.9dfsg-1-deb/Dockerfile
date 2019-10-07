FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="mapdamage" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="mapdamage" \ 
    about.summary="tracking and quantifying damage patterns in ancient DNA sequences" \ 
    about.home="https://ginolhac.github.io/mapDamage/" \ 
    software.version="2.0.9dfsg-1-deb" \ 
    upstream.version="2.0.9" \ 
    version="1" \ 
    extra.identifiers.biotools="mapdamage" \ 
    about.copyright="2012-2015 Jnsson H, Ginolhac A, Schubert M, Johnson P, Orlando L." \ 
    about.license="expat" \ 
    about.license_file="/usr/share/doc/mapdamage/copyright" \ 
    extra.binaries="/usr/bin/mapDamage" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y mapdamage || apt-get install -y mapdamage) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
