FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="mapdamage" \ 
    container="mapdamage" \ 
    about.summary="tracking and quantifying damage patterns in ancient DNA sequences" \ 
    about.home="https://ginolhac.github.io/mapDamage/" \ 
    software.version="2.0.6dfsg-2-deb" \ 
    version="1" \ 
    extra.identifiers.biotools="mapdamage" \ 
    about.copyright="2012-2015 Jnsson H, Ginolhac A, Schubert M, Johnson P, Orlando L." \ 
    about.license="expat" \ 
    about.license_file="/usr/share/doc/mapdamage/copyright" \ 
    extra.binaries="/usr/bin/mapDamage" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y mapdamage && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
