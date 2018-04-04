FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="openmolar" \ 
    container="openmolar" \ 
    about.summary="dental practice management software" \ 
    about.home="http://openmolar.com/om1" \ 
    software.version="1.0.15-gd81f9e5-1-deb" \ 
    version="1" \ 
    about.copyright="2009-2014 Neil Wallace <neil@openmolar.com>" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/openmolar/copyright" \ 
    extra.binaries="/usr/bin/openmolar" \ 
    about.tags="field::medicine, interface::graphical, interface::x11, role::program,:timekeeping, x11::application" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y openmolar && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
