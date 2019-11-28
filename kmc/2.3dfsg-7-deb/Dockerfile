FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="kmc" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="kmc" \ 
    about.summary="count kmers in genomic sequences" \ 
    about.home="http://sun.aei.polsl.pl/kmc" \ 
    software.version="2.3dfsg-7-deb" \ 
    upstream.version="2.3" \ 
    version="1" \ 
    extra.identifiers.biotools="kmc" \ 
    about.copyright=" 2012-2015 Sebastian Deorowicz <sebastian.deorowicz@polsl.pl>" \ 
    about.license="GPL-3" \ 
    about.license_file="/usr/share/doc/kmc/copyright" \ 
    extra.binaries="/usr/bin/kmc,/usr/bin/kmc_dump,/usr/bin/kmc_tools" \ 
    about.tags="field::biology, field::biology:bioinformatics, implemented-in::c++,:commandline,:shell, role::program,:calculation, scope::utility, use::analysing, use::calculating" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y kmc || apt-get install -y kmc) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
