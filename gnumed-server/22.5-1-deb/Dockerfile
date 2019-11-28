FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="gnumed-server" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="gnumed-server" \ 
    about.summary="medical practice management - server" \ 
    about.home="http://www.gnumed.de" \ 
    software.version="22.5-1-deb" \ 
    upstream.version="22.5" \ 
    version="1" \ 
    about.copyright=" 2000-2005 Horst Herb, a.o." \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/gnumed-server/copyright" \ 
    extra.binaries="/usr/bin/gm-move_backups_offsite,/usr/bin/gm-remove_person" \ 
    about.tags="field::medicine, network::server, role::program, use::organizing" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y gnumed-server || apt-get install -y gnumed-server) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
