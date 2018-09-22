FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="seqprep-data" \ 
    container="seqprep-data" \ 
    about.summary="example data set for seqprep - only used for testing" \ 
    about.home="http://seqanswers.com/wiki/SeqPrep" \ 
    software.version="1.3.2-1-deb" \ 
    version="1" \ 
    extra.identifiers.biotools="seqprep" \ 
    about.copyright="(C) 2011-2017 by John St. John" \ 
    about.license="MIT" \ 
    about.license_file="/usr/share/doc/seqprep-data/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y seqprep-data && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
