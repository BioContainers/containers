FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="emboss-lib" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="emboss-lib" \ 
    about.summary="EMBOSS Libraries" \ 
    about.home="http://emboss.sourceforge.net" \ 
    software.version="6.6.0dfsg-7b1-deb" \ 
    upstream.version="6.6.0" \ 
    version="1" \ 
    about.license="custom, see /usr/share/doc/emboss-lib/copyright" \ 
    about.license_file="/usr/share/doc/emboss-lib/copyright" \ 
    about.tags="devel::lang:c, devel::library, field::biology,:biology:bioinformatics, implemented-in::c,:commandline, role::devel-lib, role::program,:shared-lib" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y emboss-lib || apt-get install -y emboss-lib) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
