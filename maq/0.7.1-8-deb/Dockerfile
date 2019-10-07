FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="maq" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="maq" \ 
    about.summary="maps short fixed-length polymorphic DNA sequence reads to reference sequences" \ 
    about.home="http://maq.sourceforge.net/" \ 
    software.version="0.7.1-8-deb" \ 
    upstream.version="0.7.1" \ 
    version="1" \ 
    extra.identifiers.biotools="maq" \ 
    about.copyright="2003-2008, Heng Li <lh3@sanger.ac.uk>" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/maq/copyright" \ 
    extra.binaries="/usr/bin/farm-run.pl,/usr/bin/maq,/usr/bin/maq.pl,/usr/bin/maq_eval.pl,/usr/bin/maq_plot.pl" \ 
    about.tags="field::biology, field::biology:bioinformatics, implemented-in::c++,:perl, interface::commandline, role::program,:utility, use::TODO, use::analysing, use::comparing,:searching, works-with-format::TODO, works-with-format::plaintext,:TODO" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y maq || apt-get install -y maq) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
