FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="biomaj3-download" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="biomaj3-download" \ 
    about.summary="BioMAJ download management library" \ 
    about.home="https://github.com/genouest/biomaj-download" \ 
    software.version="3.0.19-1-deb-py3" \ 
    upstream.version="3.0.19" \ 
    version="1" \ 
    about.copyright="Olivier Sallou <olivier.sallou@irisa.fr>" \ 
    about.license="AGPL-3" \ 
    about.license_file="/usr/share/doc/biomaj3-download/copyright" \ 
    extra.binaries="/usr/bin/biomaj-download-consumer,/usr/bin/biomaj-download-web,/usr/bin/biomaj_download_consumer.py" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y python3-biomaj3-download || apt-get install -y python3-biomaj3-download) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
