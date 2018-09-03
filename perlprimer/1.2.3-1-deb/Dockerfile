FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="perlprimer" \ 
    container="perlprimer" \ 
    about.summary="Graphical design of primers for PCR" \ 
    about.home="http://perlprimer.sourceforge.net" \ 
    software.version="1.2.3-1-deb" \ 
    version="1" \ 
    about.copyright=" 2003-2017 Owen Marshall <owenjm@users.sourceforge.net>" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/perlprimer/copyright" \ 
    extra.binaries="/usr/bin/perlprimer" \ 
    about.tags="biology::format:aln, biology::peptidic, field::biology,:biology:molecular, implemented-in::perl, interface::graphical,:x11, network::client, role::program, scope::utility,:tk, use::analysing, works-with-format::plaintext,:application" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y perlprimer && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
