FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="mencal" \ 
    container="mencal" \ 
    about.summary="menstruation calendar" \ 
    about.home="http://kyberdigi.cz/projects/mencal/" \ 
    software.version="3.0-2-deb" \ 
    version="1" \ 
    about.copyright="(C) 2001-2012 C. McCohy <mccohy@kyberdigi.cz>" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/mencal/copyright" \ 
    extra.binaries="/usr/bin/mencal" \ 
    about.tags="field::medicine, implemented-in::perl, interface::commandline,:program, scope::utility, use::timekeeping" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y mencal && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
