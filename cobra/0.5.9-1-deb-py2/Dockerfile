FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="cobra" \ 
    container="cobra" \ 
    about.summary="constraint-based modeling of biological networks (Python 2)" \ 
    about.home="http://opencobra.github.io/cobrapy/" \ 
    software.version="0.5.9-1-deb-py2" \ 
    version="1" \ 
    about.copyright="" \ 
    about.license="GPL-2+ or LGPL-2.0+" \ 
    about.license_file="/usr/share/doc/cobra/copyright" \ 
    about.tags="field::biology, implemented-in::python, science::modelling" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y python-cobra && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
