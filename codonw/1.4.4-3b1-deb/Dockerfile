FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="codonw" \ 
    container="codonw" \ 
    about.summary="Correspondence Analysis of Codon Usage" \ 
    about.home="http://codonw.sourceforge.net" \ 
    software.version="1.4.4-3b1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/codonw/copyright" \ 
    extra.binaries="/usr/bin/codonw,/usr/bin/codonw-aau,/usr/bin/codonw-base3s,/usr/bin/codonw-bases,/usr/bin/codonw-cai,/usr/bin/codonw-cbi,/usr/bin/codonw-cu,/usr/bin/codonw-cutab,/usr/bin/codonw-cutot,/usr/bin/codonw-dinuc,/usr/bin/codonw-enc,/usr/bin/codonw-fop,/usr/bin/codonw-gc,/usr/bin/codonw-gc3s,/usr/bin/codonw-raau,/usr/bin/codonw-reader,/usr/bin/codonw-rscu,/usr/bin/codonw-tidy,/usr/bin/codonw-transl" \ 
    extra.identifiers.conda="codonw" \ 
    about.tags="biology::nucleic-acids, field::biology, field::biology:bioinformatics,:c, interface::text-mode, role::program, scope::utility,:analysing" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y codonw && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
