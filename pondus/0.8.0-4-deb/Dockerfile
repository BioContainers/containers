FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="pondus" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="pondus" \ 
    about.summary="personal weight manager for GTK+2" \ 
    about.home="http://bitbucket.org/eike/pondus/" \ 
    software.version="0.8.0-4-deb" \ 
    upstream.version="0.8.0" \ 
    version="1" \ 
    about.copyright="2007-2011 Eike Nicklas <eike@ephys.de>" \ 
    about.license="Expat" \ 
    about.license_file="/usr/share/doc/pondus/copyright" \ 
    extra.binaries="/usr/bin/pondus" \ 
    about.tags="field::TODO, field::medicine, implemented-in::python,:graphical,:x11, role::program, scope::utility,:gtk, use::editing, use::monitor, works-with::people,:application" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y pondus || apt-get install -y pondus) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
