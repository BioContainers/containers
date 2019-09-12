FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="genometester" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="genometester" \ 
    about.summary="toolkit for performing set operations on k-mer lists" \ 
    about.home="https://github.com/bioinfo-ut/GenomeTester4" \ 
    software.version="4.0git20180508.a9c14a6dfsg-1-deb" \ 
    upstream.version="4.0" \ 
    version="1" \ 
    extra.identifiers.biotools="genometester" \ 
    about.copyright="2014-2016 University of Tartu" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/genometester/copyright" \ 
    extra.binaries="/usr/bin/gdistribution,/usr/bin/glistcompare,/usr/bin/glistmaker,/usr/bin/glistquery,/usr/bin/gmer_caller,/usr/bin/gmer_counter" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y genometester || apt-get install -y genometester) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
