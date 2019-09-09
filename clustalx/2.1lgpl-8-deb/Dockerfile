FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="clustalx" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="clustalx" \ 
    about.summary="Multiple alignment of nucleic acid and protein sequences (graphical interface)" \ 
    about.home="http://www.clustal.org/clustal2/" \ 
    software.version="2.1lgpl-8-deb" \ 
    upstream.version="2.1" \ 
    version="1" \ 
    about.copyright=" Des Higgins, Julie Thompson and Toby Gibson" \ 
    about.license="LGPL-3+" \ 
    about.license_file="/usr/share/doc/clustalx/copyright" \ 
    extra.binaries="/usr/bin/clustalx" \ 
    about.tags="biology::format:aln, biology::peptidic, field::biology,:biology:bioinformatics, implemented-in::c,:commandline,:graphical,:x11,:program, scope::utility, uitoolkit::motif, uitoolkit::qt,:analysing,:comparing,:viewing,:plaintext, works-with::TODO, x11::application" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y clustalx || apt-get install -y clustalx) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
