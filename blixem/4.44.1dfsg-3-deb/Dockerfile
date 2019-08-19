FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="blixem" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="blixem" \ 
    about.summary="interactive browser of sequence alignments" \ 
    about.home="http://www.sanger.ac.uk/science/tools/seqtools" \ 
    software.version="4.44.1dfsg-3-deb" \ 
    upstream.version="4.44.1" \ 
    version="1" \ 
    extra.identifiers.biotools="seqtools" \ 
    about.copyright="1991-2017 Eric Sonnhammer, Richard Durbin, Jean Thierry-Mieg" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/blixem/copyright" \ 
    extra.binaries="/usr/bin/blixem,/usr/bin/blixemh" \ 
    about.tags="uitoolkit::gtk" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y blixem || apt-get install -y blixem) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
