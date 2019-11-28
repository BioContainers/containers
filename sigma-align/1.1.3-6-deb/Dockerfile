FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="sigma-align" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="sigma-align" \ 
    about.summary="Simple greedy multiple alignment of non-coding DNA sequences" \ 
    about.home="http://www.imsc.res.in/~rsidd/sigma/" \ 
    software.version="1.1.3-6-deb" \ 
    upstream.version="1.1.3" \ 
    version="1" \ 
    about.copyright="Rahul Siddharthan, 2006-2009" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/sigma-align/copyright" \ 
    extra.binaries="/usr/bin/sigma" \ 
    about.tags="field::biology, field::biology:bioinformatics, implemented-in::c,:commandline, role::program, scope::utility, use::analysing,:comparing, works-with-format::plaintext, works-with::TODO" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y sigma-align || apt-get install -y sigma-align) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
