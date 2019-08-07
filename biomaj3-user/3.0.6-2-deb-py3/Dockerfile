FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="biomaj3-user" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="biomaj3-user" \ 
    about.summary="BioMAJ user management library" \ 
    about.home="https://github.com/genouest/biomaj-user" \ 
    software.version="3.0.6-2-deb-py3" \ 
    upstream.version="3.0.6" \ 
    version="1" \ 
    about.copyright="Olivier Sallou <olivier.sallou@irisa.fr>" \ 
    about.license="AGPL-3" \ 
    about.license_file="/usr/share/doc/biomaj3-user/copyright" \ 
    extra.binaries="/usr/bin/biomaj-users,/usr/bin/biomaj-users-web,/usr/bin/biomaj-users.py" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y python3-biomaj3-user || apt-get install -y python3-biomaj3-user) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
