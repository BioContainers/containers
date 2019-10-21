FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="profphd-utils" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="profphd-utils" \ 
    about.summary="profphd helper utilities convert_seq and filter_hssp" \ 
    about.home="http://www.rostlab.org/" \ 
    software.version="1.0.10-5-deb" \ 
    upstream.version="1.0.10" \ 
    version="1" \ 
    about.copyright="1998-2011 by Burkhard Rost <rost@rostlab.org> EMBL, CUBIC (Columbia University, NY, USA) and LION Biosciences (Heidelberg, DE)" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/profphd-utils/copyright" \ 
    extra.binaries="/usr/bin/convert_seq,/usr/bin/filter_hssp" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y profphd-utils || apt-get install -y profphd-utils) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
