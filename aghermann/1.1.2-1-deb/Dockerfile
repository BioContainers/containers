FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="aghermann" \ 
    container="aghermann" \ 
    about.summary="Sleep-research experiment manager" \ 
    about.home="http://johnhommer.com/academic/code/aghermann" \ 
    software.version="1.1.2-1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/aghermann/copyright" \ 
    extra.binaries="/usr/bin/agh-profile-gen,/usr/bin/aghermann,/usr/bin/edfcat,/usr/bin/edfhed,/usr/bin/edfhed-gtk" \ 
    about.tags="field::medicine, role::program, uitoolkit::gtk, use::analysing" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y aghermann && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
