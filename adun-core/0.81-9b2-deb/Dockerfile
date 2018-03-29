FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="adun-core" \ 
    container="adun-core" \ 
    about.summary="Molecular Simulator" \ 
    about.home="http://diana.imim.es/Adun" \ 
    software.version="0.81-9b2-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/adun-core/copyright" \ 
    extra.binaries="/usr/bin/AdunCore,/usr/bin/AdunServer" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y adun-core && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
