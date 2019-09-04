FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="acedb-other-belvu" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="acedb-other-belvu" \ 
    about.summary="transitional package for belvu" \ 
    about.home="http://www.acedb.org/" \ 
    software.version="4.9.39dfsg.02-4-deb" \ 
    upstream.version="4.9.39" \ 
    version="1" \ 
    about.copyright="" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/acedb-other-belvu/copyright" \ 
    about.tags="interface::graphical, interface::x11, role::program, uitoolkit::gtk,:ncurses, x11::application" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y acedb-other-belvu || apt-get install -y acedb-other-belvu) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
