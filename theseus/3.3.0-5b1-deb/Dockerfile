FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="theseus" \ 
    container="theseus" \ 
    about.summary="superimpose macromolecules using maximum likelihood" \ 
    about.home="http://www.theseus3d.org" \ 
    software.version="3.3.0-5b1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/theseus/copyright" \ 
    extra.binaries="/usr/bin/theseus,/usr/bin/theseus_align" \ 
    about.tags="biology::peptidic, field::biology, field::biology:bioinformatics,:biology:structural, implemented-in::c, interface::commandline,:program, use::analysing, use::comparing,:plaintext" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y theseus && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
