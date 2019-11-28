FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="reapr" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="reapr" \ 
    about.summary="universal tool for genome assembly evaluation" \ 
    about.home="http://www.sanger.ac.uk/science/tools/reapr" \ 
    software.version="1.0.18dfsg-4-deb" \ 
    upstream.version="1.0.18" \ 
    version="1" \ 
    about.copyright=" 2013-2015 Genome Research Ltd." \ 
    about.license="GPL-3" \ 
    about.license_file="/usr/share/doc/reapr/copyright" \ 
    extra.binaries="/usr/bin/reapr" \ 
    about.tags="biology::nucleic-acids, field::biology, field::biology:bioinformatics,:c++, interface::commandline, role::program,:biological-sequence" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y reapr || apt-get install -y reapr) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
