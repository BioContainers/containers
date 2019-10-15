FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="minia" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="minia" \ 
    about.summary="short-read biological sequence assembler" \ 
    about.home="http://minia.genouest.org/" \ 
    software.version="1.6906-2-deb" \ 
    upstream.version="1.6906" \ 
    version="1" \ 
    extra.identifiers.biotools="minia" \ 
    about.copyright="2012 Rayan Chiki <rayan.chikhi@ens-cachan.org>" \ 
    about.license="CeCILL" \ 
    about.license_file="/usr/share/doc/minia/copyright" \ 
    extra.binaries="/usr/bin/minia" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y minia || apt-get install -y minia) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
