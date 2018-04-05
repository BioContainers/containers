FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="smrtanalysis-dev" \ 
    container="smrtanalysis-dev" \ 
    about.summary="develepment libraries for smrtanalysis" \ 
    about.home="http://www.pacb.com/products-and-services/analytical-software/smrt-analysis/" \ 
    software.version="020161126-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/smrtanalysis-dev/copyright" \ 
    about.tags="devel::library, role::devel-lib" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y smrtanalysis-dev && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
