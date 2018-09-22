FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="autodock-vina" \ 
    container="autodock-vina" \ 
    about.summary="docking of small molecules to proteins" \ 
    about.home="http://vina.scripps.edu" \ 
    software.version="1.1.2-3b6-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/autodock-vina/copyright" \ 
    extra.binaries="/usr/bin/vina,/usr/bin/vina_split" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y autodock-vina && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
