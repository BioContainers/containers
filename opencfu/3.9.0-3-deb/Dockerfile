FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="opencfu" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="opencfu" \ 
    about.summary="count cell colonies (CFUs) on agar plates by processing digital pictures" \ 
    about.home="http://opencfu.sourceforge.net/" \ 
    software.version="3.9.0-3-deb" \ 
    upstream.version="3.9.0" \ 
    version="1" \ 
    about.copyright="2010-2014 Quentin Geissmann <qgeissmann@gmail.com>" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/opencfu/copyright" \ 
    extra.binaries="/usr/bin/opencfu" \ 
    about.tags="field::biology, field::medicine, field::medicine:imaging,:graphical,:x11, role::program, uitoolkit::gtk,:analysing,:learning,:measuring,:viewing,:application" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y opencfu || apt-get install -y opencfu) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
