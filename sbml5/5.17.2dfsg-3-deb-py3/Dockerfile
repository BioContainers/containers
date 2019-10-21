FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="sbml5" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="sbml5" \ 
    about.summary="System Biology Markup Language library - Python3 bindings" \ 
    about.home="http://www.sbml.org/" \ 
    software.version="5.17.2dfsg-3-deb-py3" \ 
    upstream.version="5.17.2" \ 
    version="1" \ 
    extra.identifiers.biotools="libsbml" \ 
    about.license="custom, see /usr/share/doc/sbml5/copyright" \ 
    about.license_file="/usr/share/doc/sbml5/copyright" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y python3-sbml5 || apt-get install -y python3-sbml5) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
