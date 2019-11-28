FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="kalign" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="kalign" \ 
    about.summary="Global and progressive multiple sequence alignment" \ 
    about.home="http://msa.sbc.su.se/" \ 
    software.version="1-2.0320110620-5-deb" \ 
    version="1" \ 
    extra.identifiers.biotools="kalign" \ 
    about.copyright=" 2004-2008 Timo Lassmann <timolassmann@gmail.com>" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/kalign/copyright" \ 
    extra.binaries="/usr/bin/kalign" \ 
    about.tags="biology::format:aln, biology::peptidic, field::biology,:biology:bioinformatics, implemented-in::c,:commandline, role::program, scope::utility, use::comparing,:plaintext, works-with::TODO" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y kalign || apt-get install -y kalign) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
