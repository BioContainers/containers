FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="proteinortho" \ 
    container="proteinortho" \ 
    about.summary="Detection of (Co-)orthologs in large-scale protein analysis" \ 
    about.home="https://www.bioinf.uni-leipzig.de/Software/proteinortho/" \ 
    software.version="5.15dfsg-1-deb" \ 
    version="1" \ 
    about.copyright="2009-2014 Marcus Lechner <lechner@staff.uni-marburg.de>" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/proteinortho/copyright" \ 
    extra.binaries="/usr/bin/proteinortho5" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y proteinortho && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
