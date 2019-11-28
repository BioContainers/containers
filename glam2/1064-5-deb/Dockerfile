FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="glam2" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="glam2" \ 
    about.summary="gapped protein motifs from unaligned sequences" \ 
    about.home="http://acb.qfab.org/acb/glam2/" \ 
    software.version="1064-5-deb" \ 
    upstream.version="1064" \ 
    version="1" \ 
    about.copyright="2007 Martin C Frith <martin@cbrc.jp>" \ 
    about.license="PD_glam" \ 
    about.license_file="/usr/share/doc/glam2/copyright" \ 
    extra.binaries="/usr/bin/glam2,/usr/bin/glam2-purge,/usr/bin/glam2format,/usr/bin/glam2mask,/usr/bin/glam2scan" \ 
    extra.identifiers.doi="10.1371/journal.pcbi.1000071" \ 
    about.tags="field::biology, field::biology:bioinformatics, implemented-in::c,:commandline, role::program, scope::utility, use::analysing,:comparing,:searching, works-with-format::TODO,:plaintext, works-with::TODO" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y glam2 || apt-get install -y glam2) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
