FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="biomaj3-process" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="biomaj3-process" \ 
    about.summary="BioMAJ process management library" \ 
    about.home="https://github.com/genouest/biomaj-process" \ 
    software.version="3.0.11-1-deb-py3" \ 
    upstream.version="3.0.11" \ 
    version="1" \ 
    about.copyright="Olivier Sallou <olivier.sallou@irisa.fr>" \ 
    about.license="AGPL-3" \ 
    about.license_file="/usr/share/doc/biomaj3-process/copyright" \ 
    extra.binaries="/usr/bin/biomaj-process-consumer,/usr/bin/biomaj-process-web,/usr/bin/biomaj_process_consumer.py" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y python3-biomaj3-process || apt-get install -y python3-biomaj3-process) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
