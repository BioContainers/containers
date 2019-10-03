FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="invesalius-bin" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="invesalius-bin" \ 
    about.summary="Implementation of MIDA and contour based visualizations" \ 
    about.home="http://www.cti.gov.br/invesalius/" \ 
    software.version="3.1.99992-3-deb" \ 
    upstream.version="3.1.99992" \ 
    version="1" \ 
    about.copyright=" 2008-2017 Centro de Tecnologia da Informao Renato Archer <invesalius@cti.gov.br>" \ 
    about.license="GPL-2" \ 
    about.license_file="/usr/share/doc/invesalius-bin/copyright" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y invesalius-bin || apt-get install -y invesalius-bin) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
