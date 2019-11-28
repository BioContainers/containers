FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="perlprimer" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="perlprimer" \ 
    about.summary="Graphical design of primers for PCR" \ 
    about.home="http://perlprimer.sourceforge.net" \ 
    software.version="1.2.4-1-deb" \ 
    upstream.version="1.2.4" \ 
    version="1" \ 
    about.copyright=" 2003-2017 Owen Marshall <owenjm@users.sourceforge.net>" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/perlprimer/copyright" \ 
    extra.binaries="/usr/bin/perlprimer" \ 
    about.tags="biology::format:aln, biology::peptidic, field::biology,:biology:bioinformatics,:biology:molecular,:perl, interface::commandline, interface::graphical,:x11, network::client, role::program, scope::utility,:tk, use::analysing, works-with-format::plaintext,:application" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y perlprimer || apt-get install -y perlprimer) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
