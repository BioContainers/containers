FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="sphinxcontrib-autoprogram" \ 
    container="sphinxcontrib-autoprogram" \ 
    about.summary="automated documentation of CLI programs for Sphinx (Python 2)" \ 
    about.home="https://pythonhosted.org/sphinxcontrib-autoprogram/" \ 
    software.version="0.1.2-1-deb" \ 
    version="1" \ 
    about.copyright="2014 by Hong Minhee <@hongminhee.org>" \ 
    about.license="BSD-3-clause" \ 
    about.license_file="/usr/share/doc/sphinxcontrib-autoprogram/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y sphinxcontrib-autoprogram && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
