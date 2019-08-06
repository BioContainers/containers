FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="belvu" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="belvu" \ 
    about.summary="multiple sequence alignment viewer and phylogenetic tool" \ 
    about.home="http://www.sanger.ac.uk/science/tools/seqtools" \ 
    software.version="4.44.1dfsg-3-deb" \ 
    upstream.version="4.44.1" \ 
    version="1" \ 
    extra.identifiers.biotools="seqtools" \ 
    about.copyright="1991-2017 Eric Sonnhammer, Richard Durbin, Jean Thierry-Mieg" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/belvu/copyright" \ 
    extra.binaries="/usr/bin/belvu" \ 
    about.tags="uitoolkit::gtk" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y belvu || apt-get install -y belvu) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
