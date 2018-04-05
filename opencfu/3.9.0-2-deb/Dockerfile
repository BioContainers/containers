FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="opencfu" \ 
    container="opencfu" \ 
    about.summary="count cell colonies (CFUs) on agar plates by processing digital pictures" \ 
    about.home="http://opencfu.sourceforge.net/" \ 
    software.version="3.9.0-2-deb" \ 
    version="1" \ 
    about.copyright="2010-2014 Quentin Geissmann <qgeissmann@gmail.com>" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/opencfu/copyright" \ 
    extra.binaries="/usr/bin/opencfu" \ 
    about.tags="field::biology, field::medicine, field::medicine:imaging,:graphical,:x11, role::program, uitoolkit::gtk,:analysing,:learning,:measuring,:viewing,:application" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y opencfu && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
