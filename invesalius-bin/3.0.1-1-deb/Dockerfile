FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="invesalius-bin" \ 
    container="invesalius-bin" \ 
    about.summary="Implementation of MIDA and contour based visualizations" \ 
    about.home="http://www.cti.gov.br/invesalius/" \ 
    software.version="3.0.1-1-deb" \ 
    version="1" \ 
    about.copyright=" 2008-2010 Centro de Tecnologia da Informao Renato Archer <invesalius@cti.gov.br>" \ 
    about.license="GPL-2" \ 
    about.license_file="/usr/share/doc/invesalius-bin/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y invesalius-bin && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
