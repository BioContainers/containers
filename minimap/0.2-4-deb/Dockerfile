FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="minimap" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="minimap" \ 
    about.summary="tool for approximate mapping of long biosequences such as DNA reads" \ 
    about.home="https://github.com/lh3/minimap" \ 
    software.version="0.2-4-deb" \ 
    upstream.version="0.2" \ 
    version="1" \ 
    about.copyright=" 2015 Broad Institute <hengli@broadinstitute.org>" \ 
    about.license="MIT" \ 
    about.license_file="/usr/share/doc/minimap/copyright" \ 
    extra.binaries="/usr/bin/minimap" \ 
    about.tags="field::biology, field::biology:bioinformatics, implemented-in::c,:commandline, role::program, scope::utility,:calculating, works-with::biological-sequence" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y minimap || apt-get install -y minimap) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
