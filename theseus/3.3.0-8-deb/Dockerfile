FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="theseus" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="theseus" \ 
    about.summary="superimpose macromolecules using maximum likelihood" \ 
    about.home="http://www.theseus3d.org" \ 
    software.version="3.3.0-8-deb" \ 
    upstream.version="3.3.0" \ 
    version="1" \ 
    about.copyright=" 2003-2015, Douglas L. Theobald" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/theseus/copyright" \ 
    extra.binaries="/usr/bin/theseus,/usr/bin/theseus_align" \ 
    about.tags="biology::peptidic, field::biology, field::biology:bioinformatics,:biology:structural, implemented-in::c, interface::commandline,:program, use::analysing, use::comparing,:plaintext" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y theseus || apt-get install -y theseus) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
