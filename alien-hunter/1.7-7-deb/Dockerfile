FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="alien-hunter" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="alien-hunter" \ 
    about.summary="Interpolated Variable Order Motifs to identify horizontally acquired DNA" \ 
    about.home="http://www.sanger.ac.uk/science/tools/alien-hunter" \ 
    software.version="1.7-7-deb" \ 
    upstream.version="1.7" \ 
    version="2" \ 
    about.copyright="2006-2008 George Vernikos" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/alien-hunter/copyright" \ 
    extra.binaries="/usr/bin/alien_hunter" \ 
    about.tags="field::biology, field::biology:structural, implemented-in::java,:perl, interface::commandline, role::program,:utility, use::analysing" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y alien-hunter || apt-get install -y alien-hunter) && apt-get install -y libfindbin-libs-perl && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
