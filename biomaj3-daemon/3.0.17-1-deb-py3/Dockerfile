FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="biomaj3-daemon" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="biomaj3-daemon" \ 
    about.summary="BioMAJ daemon library" \ 
    about.home="https://github.com/genouest/biomaj-daemon" \ 
    software.version="3.0.17-1-deb-py3" \ 
    upstream.version="3.0.17" \ 
    version="1" \ 
    about.copyright="Olivier Sallou <olivier.sallou@irisa.fr>" \ 
    about.license="AGPL-3" \ 
    about.license_file="/usr/share/doc/biomaj3-daemon/copyright" \ 
    extra.binaries="/usr/bin/biomaj-daemon-consumer,/usr/bin/biomaj-daemon-web,/usr/bin/biomaj_daemon_consumer.py" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y python3-biomaj3-daemon || apt-get install -y python3-biomaj3-daemon) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
