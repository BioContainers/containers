FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="parsnp" \ 
    container="parsnp" \ 
    about.summary="rapid core genome multi-alignment" \ 
    about.home="http://harvest.readthedocs.org/en/latest/content/parsnp.html" \ 
    software.version="1.2dfsg-3-deb" \ 
    version="1" \ 
    about.copyright="2014-2016 MarBL, Battelle National Biodefense Institute (BNBI)" \ 
    about.license="BSD-3-clause" \ 
    about.license_file="/usr/share/doc/parsnp/copyright" \ 
    extra.binaries="/usr/bin/parsnp" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y parsnp && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
