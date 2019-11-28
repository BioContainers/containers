FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="bamtools" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="bamtools" \ 
    about.summary="toolkit for manipulating BAM (genome alignment) files" \ 
    about.home="https://github.com/pezmaster31/bamtools/wiki" \ 
    software.version="2.5.1dfsg-3-deb" \ 
    upstream.version="2.5.1" \ 
    version="1" \ 
    extra.identifiers.biotools="bamtools" \ 
    about.copyright="2009-2012 Derek Barnett <derekwbarnett@gmail.com>" \ 
    about.license="Expat" \ 
    about.license_file="/usr/share/doc/bamtools/copyright" \ 
    extra.binaries="/usr/bin/bamtools" \ 
    about.tags="implemented-in::c++, role::program" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y bamtools || apt-get install -y bamtools) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
