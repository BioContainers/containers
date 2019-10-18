FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="populations" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="populations" \ 
    about.summary="population genetic software" \ 
    about.home="http://www.bioinformatics.org/~tryphon/populations/" \ 
    software.version="1.2.33svn0120106dfsg-2-deb" \ 
    upstream.version="1.2.33" \ 
    version="1" \ 
    about.copyright="2005-2010 Olivier Langella <olivier.langella@laposte.net>" \ 
    about.license="GPL-2" \ 
    about.license_file="/usr/share/doc/populations/copyright" \ 
    extra.binaries="/usr/bin/populations" \ 
    about.tags="interface::graphical, interface::x11, role::program, uitoolkit::qt,:application" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y populations || apt-get install -y populations) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
