FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="adun-core" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="adun-core" \ 
    about.summary="Molecular Simulator" \ 
    about.home="http://wiki.gnustep.org/index.php/Adun" \ 
    software.version="0.81-13-deb" \ 
    upstream.version="0.81" \ 
    version="1" \ 
    about.copyright=" 2003-2007 Alexander V. Diemand (MolTalk)" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/adun-core/copyright" \ 
    extra.binaries="/usr/bin/AdunCore,/usr/bin/AdunServer" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y adun-core || apt-get install -y adun-core) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
