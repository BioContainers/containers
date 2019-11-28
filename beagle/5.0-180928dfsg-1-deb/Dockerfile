FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="beagle" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="beagle" \ 
    about.summary="Genotype calling, genotype phasing and imputation of ungenotyped markers" \ 
    about.home="https://faculty.washington.edu/browning/beagle/beagle.html" \ 
    software.version="5.0-180928dfsg-1-deb" \ 
    upstream.version="5.0" \ 
    version="1" \ 
    extra.identifiers.biotools="beagle" \ 
    about.copyright="2013-2018 Brian L. Browning" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/beagle/copyright" \ 
    extra.binaries="/usr/bin/beagle,/usr/bin/bref3" \ 
    about.tags="field::biology, field::biology:bioinformatics, implemented-in::java,:commandline, role::program, use::analysing" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y beagle || apt-get install -y beagle) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
