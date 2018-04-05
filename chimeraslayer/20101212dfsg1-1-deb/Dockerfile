FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="chimeraslayer" \ 
    container="chimeraslayer" \ 
    about.summary="detects likely chimeras in PCR amplified DNA" \ 
    about.home="http://microbiomeutil.sourceforge.net/" \ 
    software.version="20101212dfsg1-1-deb" \ 
    version="1" \ 
    about.copyright=" 2009-2010 The Broad Institute <http://www.broadinstitute.org>" \ 
    about.license="BSD-3-clause" \ 
    about.license_file="/usr/share/doc/chimeraslayer/copyright" \ 
    extra.binaries="/usr/bin/chimeraslayer" \ 
    about.tags="biology::nucleic-acids, field::biology" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y chimeraslayer && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
