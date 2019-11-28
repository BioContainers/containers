FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="aragorn" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="aragorn" \ 
    about.summary="tRNA and tmRNA detection in nucleotide sequences" \ 
    about.home="http://mbio-serv2.mbioekol.lu.se/ARAGORN/" \ 
    software.version="1.2.38-2-deb" \ 
    upstream.version="1.2.38" \ 
    version="1" \ 
    about.copyright="2003-2015 Dean Laslett <gaiaquark@gmail.com>" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/aragorn/copyright" \ 
    extra.binaries="/usr/bin/aragorn" \ 
    about.tags="field::biology, field::biology:bioinformatics, implemented-in::c,:commandline, role::program, scope::utility, use::analysing,:searching, works-with-format::plaintext,:biological-sequence" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y aragorn || apt-get install -y aragorn) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
