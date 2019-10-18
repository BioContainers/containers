FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="paraclu" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="paraclu" \ 
    about.summary="Parametric clustering of genomic and transcriptomic features" \ 
    about.home="http://cbrc3.cbrc.jp/~martin/paraclu/" \ 
    software.version="9-2-deb" \ 
    upstream.version="9" \ 
    version="1" \ 
    about.copyright="20112012 Martin C. Frith" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/paraclu/copyright" \ 
    extra.binaries="/usr/bin/paraclu,/usr/bin/paraclu-cut.sh" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y paraclu || apt-get install -y paraclu) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
