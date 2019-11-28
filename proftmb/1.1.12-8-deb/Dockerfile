FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="proftmb" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="proftmb" \ 
    about.summary="per-residue prediction of bacterial transmembrane beta barrels" \ 
    about.home="http://rostlab.org/" \ 
    software.version="1.1.12-8-deb" \ 
    upstream.version="1.1.12" \ 
    version="1" \ 
    extra.identifiers.biotools="proftmb" \ 
    about.copyright="2004 Henry Bigelow <hrbigelow@gmail.com>, Columbia University in the City of New York, USA" \ 
    about.license="GPL-3.0+" \ 
    about.license_file="/usr/share/doc/proftmb/copyright" \ 
    extra.binaries="/usr/bin/proftmb" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y proftmb || apt-get install -y proftmb) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
