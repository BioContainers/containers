FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="autodock-vina" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="autodock-vina" \ 
    about.summary="docking of small molecules to proteins" \ 
    about.home="http://vina.scripps.edu" \ 
    software.version="1.1.2-5b1-deb" \ 
    upstream.version="1.1.2" \ 
    version="1" \ 
    about.license="custom, see /usr/share/doc/autodock-vina/copyright" \ 
    about.license_file="/usr/share/doc/autodock-vina/copyright" \ 
    extra.binaries="/usr/bin/vina,/usr/bin/vina_split" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y autodock-vina || apt-get install -y autodock-vina) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
