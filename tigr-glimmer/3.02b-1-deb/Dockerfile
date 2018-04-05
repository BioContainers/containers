FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="tigr-glimmer" \ 
    container="tigr-glimmer" \ 
    about.summary="Gene detection in archea and bacteria" \ 
    about.home="http://ccb.jhu.edu/software/glimmer/index.shtml" \ 
    software.version="3.02b-1-deb" \ 
    version="1" \ 
    about.copyright=" 1999-2008 Art Delcher <adelcher@tigr.org>," \ 
    about.license="Artistic" \ 
    about.license_file="/usr/share/doc/tigr-glimmer/copyright" \ 
    extra.binaries="/usr/bin/tigr-glimmer,/usr/bin/tigr-run-glimmer3" \ 
    about.tags="field::biology, field::biology:bioinformatics, implemented-in::c++,:commandline, role::program, scope::utility, use::searching,:TODO,:plaintext, works-with::TODO" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y tigr-glimmer && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
