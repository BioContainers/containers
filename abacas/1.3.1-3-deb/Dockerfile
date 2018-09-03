FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="abacas" \ 
    container="abacas" \ 
    about.summary="Algorithm Based Automatic Contiguation of Assembled Sequences" \ 
    about.home="http://abacas.sourceforge.net/" \ 
    software.version="1.3.1-3-deb" \ 
    version="1" \ 
    about.copyright=" 2008-10 Genome Research Limited. All Rights Reserved." \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/abacas/copyright" \ 
    extra.binaries="/usr/bin/abacas" \ 
    about.tags="field::biology, field::biology:bioinformatics, implemented-in::perl,:commandline,:text-mode, role::program,:utility" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y abacas && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
