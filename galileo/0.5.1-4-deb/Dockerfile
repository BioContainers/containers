FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="galileo" \ 
    container="galileo" \ 
    about.summary="Utility to securely synchronize a Fitbit device with the Fitbit web service" \ 
    about.home="https://bitbucket.org/benallard/galileo/" \ 
    software.version="0.5.1-4-deb" \ 
    version="1" \ 
    about.copyright="2013-2016 Benot Allard" \ 
    about.license="LGPL-3+" \ 
    about.license_file="/usr/share/doc/galileo/copyright" \ 
    extra.binaries="/usr/bin/galileo" \ 
    about.tags="field::medicine, implemented-in::python, interface::commandline,:program, use::monitor" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y galileo && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
