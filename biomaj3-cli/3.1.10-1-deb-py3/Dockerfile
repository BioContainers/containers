FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="biomaj3-cli" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="biomaj3-cli" \ 
    about.summary="BioMAJ client" \ 
    about.home="https://github.com/genouest/biomaj-cli" \ 
    software.version="3.1.10-1-deb-py3" \ 
    upstream.version="3.1.10" \ 
    version="1" \ 
    about.copyright="Olivier Sallou <olivier.sallou@irisa.fr>" \ 
    about.license="AGPL-3" \ 
    about.license_file="/usr/share/doc/biomaj3-cli/copyright" \ 
    extra.binaries="/usr/bin/biomaj-cli,/usr/bin/biomaj-cli.py" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y python3-biomaj3-cli || apt-get install -y python3-biomaj3-cli) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
