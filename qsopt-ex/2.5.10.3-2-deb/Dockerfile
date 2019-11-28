FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="qsopt-ex" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="qsopt-ex" \ 
    about.summary="Exact linear programming solver" \ 
    about.home="http://www.dii.uchile.cl/~daespino/ESolver_doc/main.html" \ 
    software.version="2.5.10.3-2-deb" \ 
    upstream.version="2.5.10.3" \ 
    version="1" \ 
    about.copyright="" \ 
    about.license="GPL-2+ or Research-Use-Only or GPL-3+" \ 
    about.license_file="/usr/share/doc/qsopt-ex/copyright" \ 
    extra.binaries="/usr/bin/esolver" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y qsopt-ex || apt-get install -y qsopt-ex) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
