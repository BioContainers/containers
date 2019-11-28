FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="seqprep" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="seqprep" \ 
    about.summary="stripping adaptors and/or merging paired reads of DNA sequences with overlap" \ 
    about.home="http://seqanswers.com/wiki/SeqPrep" \ 
    software.version="1.3.2-3-deb" \ 
    upstream.version="1.3.2" \ 
    version="1" \ 
    extra.identifiers.biotools="seqprep" \ 
    about.copyright="(C) 2011-2017 by John St. John" \ 
    about.license="MIT" \ 
    about.license_file="/usr/share/doc/seqprep/copyright" \ 
    extra.binaries="/usr/bin/seqprep" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y seqprep || apt-get install -y seqprep) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
