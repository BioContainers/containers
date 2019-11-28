FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="sga" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="sga" \ 
    about.summary="de novo genome assembler that uses string graphs" \ 
    about.home="https://github.com/jts/sga" \ 
    software.version="0.10.15-4-deb" \ 
    upstream.version="0.10.15" \ 
    version="1" \ 
    extra.identifiers.biotools="sga" \ 
    about.copyright="2009-2012 Jared T. Simpson <js18@sanger.ac.uk>" \ 
    about.license="GPL-3.0+" \ 
    about.license_file="/usr/share/doc/sga/copyright" \ 
    extra.binaries="/usr/bin/sga,/usr/bin/sga-align,/usr/bin/sga-astat,/usr/bin/sga-bam2de,/usr/bin/sga-mergeDriver" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y sga || apt-get install -y sga) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
