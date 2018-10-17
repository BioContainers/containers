FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="fitbit" \ 
    container="fitbit" \ 
    about.summary="FitBit REST API Client Implementation" \ 
    about.home="https://github.com/orcasgit/python-fitbit/" \ 
    software.version="0.2.4-1-deb-py2" \ 
    version="1" \ 
    about.copyright="(C) 2012-2016 ORCAS" \ 
    about.license="Apache-2.0" \ 
    about.license_file="/usr/share/doc/fitbit/copyright" \ 
    about.tags="devel::lang:python, devel::library, field::medicine, field::statistics,:python, role::devel-lib, science::data-acquisition" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y python-fitbit && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
