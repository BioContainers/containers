FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="macsyfinder" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="macsyfinder" \ 
    about.summary="detection of macromolecular systems in protein datasets" \ 
    about.home="https://github.com/gem-pasteur/macsyfinder" \ 
    software.version="1.0.5-2-deb" \ 
    upstream.version="1.0.5" \ 
    version="1" \ 
    extra.identifiers.biotools="macsyfinder" \ 
    about.copyright="2014 Institut Pasteur (Paris) and CNRS." \ 
    about.license="GPL-3" \ 
    about.license_file="/usr/share/doc/macsyfinder/copyright" \ 
    extra.binaries="/usr/bin/macsyfinder" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y macsyfinder || apt-get install -y macsyfinder) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
