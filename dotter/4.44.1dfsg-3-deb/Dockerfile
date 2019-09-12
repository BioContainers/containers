FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="dotter" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="dotter" \ 
    about.summary="detailed comparison of two genomic sequences" \ 
    about.home="http://www.sanger.ac.uk/science/tools/seqtools" \ 
    software.version="4.44.1dfsg-3-deb" \ 
    upstream.version="4.44.1" \ 
    version="1" \ 
    extra.identifiers.biotools="seqtools" \ 
    about.copyright="1991-2017 Eric Sonnhammer, Richard Durbin, Jean Thierry-Mieg" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/dotter/copyright" \ 
    extra.binaries="/usr/bin/dotter" \ 
    extra.identifiers.doi="10.1016/0378-1119(95)00714-8" \ 
    about.tags="uitoolkit::gtk" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y dotter || apt-get install -y dotter) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
