FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="rnahybrid" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="rnahybrid" \ 
    about.summary="Fast and effective prediction of microRNA/target duplexes" \ 
    about.home="http://bibiserv.techfak.uni-bielefeld.de/rnahybrid/submission.html" \ 
    software.version="2.1.2-5-deb" \ 
    upstream.version="2.1.2" \ 
    version="1" \ 
    extra.identifiers.biotools="rnahybrid" \ 
    about.copyright="2004 Marc Rehmsmeier, Peter Steffen, Matthias Hoechsmann." \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/rnahybrid/copyright" \ 
    extra.binaries="/usr/bin/RNAcalibrate,/usr/bin/RNAeffective,/usr/bin/RNAhybrid" \ 
    about.tags="field::biology, field::biology:bioinformatics, implemented-in::c,:commandline, role::program, scope::utility, use::analysing,:TODO, works-with::TODO" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y rnahybrid || apt-get install -y rnahybrid) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
