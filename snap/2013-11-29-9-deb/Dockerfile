FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="snap" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="snap" \ 
    about.summary="location of genes from DNA sequence with hidden markov model" \ 
    about.home="https://www.psc.edu/index.php/user-resources/software/snap" \ 
    software.version="2013-11-29-9-deb" \ 
    upstream.version="2013" \ 
    version="1" \ 
    extra.identifiers.biotools="snap" \ 
    about.copyright="2002-2013 Ian Korf <ifkorf@ucdavis.edu>" \ 
    about.license="GPL-2.0+" \ 
    about.license_file="/usr/share/doc/snap/copyright" \ 
    extra.binaries="/usr/bin/exonpairs,/usr/bin/fathom,/usr/bin/forge,/usr/bin/hmm-assembler.pl,/usr/bin/hmm-info,/usr/bin/patch-hmm.pl,/usr/bin/snap-hmm,/usr/bin/zff2gff3.pl,/usr/bin/zoe-loop" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y snap || apt-get install -y snap) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
