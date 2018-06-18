FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="squizz" \ 
    container="squizz" \ 
    about.summary="Converter for genetic sequences and alignments" \ 
    about.home="ftp://ftp.pasteur.fr/pub/gensoft/projects/squizz/" \ 
    software.version="0.99cdfsg-1-deb" \ 
    version="1" \ 
    about.copyright="2011 Nicolas Joly<njoly@pasteur.fr>" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/squizz/copyright" \ 
    extra.binaries="/usr/bin/squizz" \ 
    about.tags="field::biology:bioinformatics, implemented-in::c++,:commandline, role::program, scope::utility, use::converting" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y squizz && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
