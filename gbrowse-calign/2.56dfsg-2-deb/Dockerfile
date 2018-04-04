FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="gbrowse-calign" \ 
    container="gbrowse-calign" \ 
    about.summary="CAlign helper" \ 
    about.home="http://www.gbrowse.org/" \ 
    software.version="2.56dfsg-2-deb" \ 
    version="1" \ 
    extra.identifiers.biotools="gbrowse" \ 
    about.copyright=" 2002 Cold Spring Harbor Laboratory and University of California, Berkeley" \ 
    about.license="GPL-1+ or Artistic-2.0" \ 
    about.license_file="/usr/share/doc/gbrowse-calign/copyright" \ 
    about.tags="devel::lang:c, devel::library, field::biology:bioinformatics,:c, role::devel-lib, role::program, role::shared-lib,:utility" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y gbrowse-calign && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
