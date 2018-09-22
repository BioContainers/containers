FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="emboss-lib" \ 
    container="emboss-lib" \ 
    about.summary="EMBOSS Libraries" \ 
    about.home="http://emboss.sourceforge.net" \ 
    software.version="6.6.0dfsg-6-deb" \ 
    version="1" \ 
    extra.identifiers.biotools="emboss" \ 
    about.copyright="The EMBOSS developers or their employers." \ 
    about.license="emboss" \ 
    about.license_file="/usr/share/doc/emboss-lib/copyright" \ 
    about.tags="devel::lang:c, devel::library, field::biology,:biology:bioinformatics, implemented-in::c, role::devel-lib,:shared-lib" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y emboss-lib && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
