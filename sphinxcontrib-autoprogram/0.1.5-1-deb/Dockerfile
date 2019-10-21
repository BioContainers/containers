FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="sphinxcontrib-autoprogram" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="sphinxcontrib-autoprogram" \ 
    about.summary="automated documentation of CLI programs for Sphinx (Python 2)" \ 
    about.home="https://pythonhosted.org/sphinxcontrib-autoprogram/" \ 
    software.version="0.1.5-1-deb" \ 
    upstream.version="0.1.5" \ 
    version="1" \ 
    about.copyright="2014 by Hong Minhee <@hongminhee.org>" \ 
    about.license="BSD-3-clause" \ 
    about.license_file="/usr/share/doc/sphinxcontrib-autoprogram/copyright" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y sphinxcontrib-autoprogram || apt-get install -y sphinxcontrib-autoprogram) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
