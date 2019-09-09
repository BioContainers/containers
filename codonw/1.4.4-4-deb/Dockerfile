FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="codonw" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="codonw" \ 
    about.summary="Correspondence Analysis of Codon Usage" \ 
    about.home="http://codonw.sourceforge.net" \ 
    software.version="1.4.4-4-deb" \ 
    upstream.version="1.4.4" \ 
    version="1" \ 
    about.copyright=" 2005 John F. Peden <jfp%23hanson-codonw@yahoo.com>" \ 
    about.license="GPL-2" \ 
    about.license_file="/usr/share/doc/codonw/copyright" \ 
    extra.binaries="/usr/bin/codonw,/usr/bin/codonw-aau,/usr/bin/codonw-base3s,/usr/bin/codonw-bases,/usr/bin/codonw-cai,/usr/bin/codonw-cbi,/usr/bin/codonw-cu,/usr/bin/codonw-cutab,/usr/bin/codonw-cutot,/usr/bin/codonw-dinuc,/usr/bin/codonw-enc,/usr/bin/codonw-fop,/usr/bin/codonw-gc,/usr/bin/codonw-gc3s,/usr/bin/codonw-raau,/usr/bin/codonw-reader,/usr/bin/codonw-rscu,/usr/bin/codonw-tidy,/usr/bin/codonw-transl" \ 
    about.tags="biology::nucleic-acids, field::biology, field::biology:bioinformatics,:c, interface::commandline, interface::text-mode,:program, scope::utility, use::analysing" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y codonw || apt-get install -y codonw) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
