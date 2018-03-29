FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="art-nextgen-simulation-tools-profiles" \ 
    container="art-nextgen-simulation-tools-profiles" \ 
    about.summary="profiles for art simulation tools" \ 
    about.home="http://www.niehs.nih.gov/research/resources/software/biostatistics/art/" \ 
    software.version="20160605dfsg-2-deb" \ 
    version="1" \ 
    about.copyright="2008-2015 Weichun Huang <whduke@gmail.com>" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/art-nextgen-simulation-tools-profiles/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y art-nextgen-simulation-tools-profiles && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
