FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="rnahybrid" \ 
    container="rnahybrid" \ 
    about.summary="Fast and effective prediction of microRNA/target duplexes" \ 
    about.home="http://bibiserv.techfak.uni-bielefeld.de/rnahybrid/submission.html" \ 
    software.version="2.1.2-1b1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/rnahybrid/copyright" \ 
    extra.binaries="/usr/bin/RNAcalibrate,/usr/bin/RNAeffective,/usr/bin/RNAhybrid" \ 
    about.tags="field::biology, field::biology:bioinformatics, implemented-in::c,:commandline, role::program, scope::utility, use::analysing,:TODO, works-with::TODO" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y rnahybrid && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
