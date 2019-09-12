FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="gbrowse-calign" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="gbrowse-calign" \ 
    about.summary="CAlign helper" \ 
    about.home="http://www.gbrowse.org/" \ 
    software.version="2.56dfsg-4b1-deb" \ 
    upstream.version="2.56" \ 
    version="1" \ 
    about.license="custom, see /usr/share/doc/gbrowse-calign/copyright" \ 
    about.license_file="/usr/share/doc/gbrowse-calign/copyright" \ 
    about.tags="devel::lang:c, devel::library, field::biology,:biology:bioinformatics, implemented-in::c,:commandline, role::devel-lib, role::program,:shared-lib, scope::utility" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y gbrowse-calign || apt-get install -y gbrowse-calign) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
