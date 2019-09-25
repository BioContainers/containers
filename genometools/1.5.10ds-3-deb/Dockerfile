FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="genometools" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="genometools" \ 
    about.summary="versatile genome analysis toolkit" \ 
    about.home="http://genometools.org" \ 
    software.version="1.5.10ds-3-deb" \ 
    upstream.version="1.5.10" \ 
    version="1" \ 
    extra.identifiers.biotools="genometools" \ 
    about.license="custom, see /usr/share/doc/genometools/copyright" \ 
    about.license_file="/usr/share/doc/genometools/copyright" \ 
    extra.binaries="/usr/bin/gt" \ 
    about.tags="field::biology, field::biology:bioinformatics, implemented-in::c,:lua, interface::commandline, role::program,:ncurses" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y genometools || apt-get install -y genometools) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
