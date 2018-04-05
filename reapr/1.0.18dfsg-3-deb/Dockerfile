FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="reapr" \ 
    container="reapr" \ 
    about.summary="universal tool for genome assembly evaluation" \ 
    about.home="http://www.sanger.ac.uk/science/tools/reapr" \ 
    software.version="1.0.18dfsg-3-deb" \ 
    version="1" \ 
    about.copyright=" 2013-2015 Genome Research Ltd." \ 
    about.license="GPL-3" \ 
    about.license_file="/usr/share/doc/reapr/copyright" \ 
    extra.binaries="/usr/bin/reapr" \ 
    about.tags="biology::nucleic-acids, field::biology, field::biology:bioinformatics,:c++, interface::commandline, role::program,:biological-sequence" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y reapr && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
