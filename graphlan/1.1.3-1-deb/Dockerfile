FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="graphlan" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="graphlan" \ 
    about.summary="circular representations of taxonomic and phylogenetic trees" \ 
    about.home="https://bitbucket.org/nsegata/graphlan/wiki/Home" \ 
    software.version="1.1.3-1-deb" \ 
    upstream.version="1.1.3" \ 
    version="1" \ 
    about.copyright="2012-2016 Nicola Segata and Curtis Huttenhower" \ 
    about.license="expat" \ 
    about.license_file="/usr/share/doc/graphlan/copyright" \ 
    extra.binaries="/usr/bin/graphlan,/usr/bin/graphlan_annotate" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y graphlan || apt-get install -y graphlan) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
