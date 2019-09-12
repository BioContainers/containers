FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="figtree" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="figtree" \ 
    about.summary="graphical phylogenetic tree viewer" \ 
    about.home="http://tree.bio.ed.ac.uk/software/figtree/" \ 
    software.version="1.4.4-3-deb" \ 
    upstream.version="1.4.4" \ 
    version="1" \ 
    extra.identifiers.biotools="figtree" \ 
    about.copyright=" 2005-2011 Andrew Rambaut <a.rambaut@ed.ac.uk>" \ 
    about.license="GPL" \ 
    about.license_file="/usr/share/doc/figtree/copyright" \ 
    extra.binaries="/usr/bin/figtree" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y figtree || apt-get install -y figtree) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
