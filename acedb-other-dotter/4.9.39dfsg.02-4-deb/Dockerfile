FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="acedb-other-dotter" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="acedb-other-dotter" \ 
    about.summary="transitional package for dotter" \ 
    about.home="http://www.acedb.org/" \ 
    software.version="4.9.39dfsg.02-4-deb" \ 
    upstream.version="4.9.39" \ 
    version="1" \ 
    about.copyright="" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/acedb-other-dotter/copyright" \ 
    extra.identifiers.doi="10.1016/0378-1119(95)00714-8" \ 
    about.tags="interface::graphical, interface::x11, role::program, uitoolkit::gtk,:ncurses, x11::application" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y acedb-other-dotter || apt-get install -y acedb-other-dotter) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
