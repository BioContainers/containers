FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="abacas" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="abacas" \ 
    about.summary="close gaps in genomic alignments from short reads" \ 
    about.home="http://abacas.sourceforge.net/" \ 
    software.version="1.3.1-5-deb" \ 
    upstream.version="1.3.1" \ 
    version="1" \ 
    about.copyright=" 2008-10 Genome Research Limited. All Rights Reserved." \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/abacas/copyright" \ 
    extra.binaries="/usr/bin/abacas" \ 
    about.tags="field::biology, field::biology:bioinformatics, implemented-in::perl,:commandline,:text-mode, role::program,:utility" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y abacas || apt-get install -y abacas) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
