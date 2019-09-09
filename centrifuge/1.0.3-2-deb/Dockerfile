FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="centrifuge" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="centrifuge" \ 
    about.summary="rapid and memory-efficient system for classification of DNA sequences" \ 
    about.home="https://ccb.jhu.edu/software/centrifuge/" \ 
    software.version="1.0.3-2-deb" \ 
    upstream.version="1.0.3" \ 
    version="1" \ 
    extra.identifiers.biotools="centrifuge" \ 
    about.copyright="2013-2016 Daehwan Kim, Li Song, Florian P. Breitwieser and Steven L. Salzberg" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/centrifuge/copyright" \ 
    extra.binaries="/usr/bin/centrifuge,/usr/bin/centrifuge-build,/usr/bin/centrifuge-compress,/usr/bin/centrifuge-download,/usr/bin/centrifuge-inspect" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y centrifuge || apt-get install -y centrifuge) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
