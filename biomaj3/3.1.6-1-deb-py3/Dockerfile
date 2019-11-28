FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="biomaj3" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="biomaj3" \ 
    about.summary="BioMAJ workflow management library" \ 
    about.home="https://github.com/genouest/biomaj" \ 
    software.version="3.1.6-1-deb-py3" \ 
    upstream.version="3.1.6" \ 
    version="1" \ 
    about.copyright="Olivier Sallou <olivier.sallou@irisa.fr>" \ 
    about.license="AGPL-3" \ 
    about.license_file="/usr/share/doc/biomaj3/copyright" \ 
    extra.binaries="/usr/bin/biomaj_migrate_database.py" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y python3-biomaj3 || apt-get install -y python3-biomaj3) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
