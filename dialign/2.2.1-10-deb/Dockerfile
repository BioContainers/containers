FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="dialign" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="dialign" \ 
    about.summary="Segment-based multiple sequence alignment" \ 
    about.home="http://dialign.gobics.de/" \ 
    software.version="2.2.1-10-deb" \ 
    upstream.version="2.2.1" \ 
    version="1" \ 
    extra.identifiers.biotools="dialign" \ 
    about.copyright=" 1999 Burkhard Morgenstern" \ 
    about.license="LGPL-2.1+" \ 
    about.license_file="/usr/share/doc/dialign/copyright" \ 
    extra.binaries="/usr/bin/dialign2-2" \ 
    about.tags="biology::format:aln, biology::peptidic, field::biology,:biology:bioinformatics, implemented-in::c,:commandline, role::program, scope::utility, use::analysing,:comparing, works-with-format::plaintext" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y dialign || apt-get install -y dialign) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
