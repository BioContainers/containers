FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="velvet-tests" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="velvet-tests" \ 
    about.summary="Test data for the Velvet sequence assembler" \ 
    about.home="http://www.ebi.ac.uk/~zerbino/velvet/" \ 
    software.version="1.2.10dfsg1-5-deb" \ 
    upstream.version="1.2.10" \ 
    version="1" \ 
    extra.identifiers.biotools="velvet" \ 
    about.copyright=" 2006-2011 Daniel Zerbino <zerbino@ebi.ac.uk>" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/velvet-tests/copyright" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y velvet-tests || apt-get install -y velvet-tests) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
