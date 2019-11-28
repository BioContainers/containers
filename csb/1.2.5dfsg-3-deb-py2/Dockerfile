FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="csb" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="csb" \ 
    about.summary="Python framework for structural bioinformatics" \ 
    about.home="https://github.com/csb-toolbox/CSB" \ 
    software.version="1.2.5dfsg-3-deb-py2" \ 
    upstream.version="1.2.5" \ 
    version="1" \ 
    about.copyright="2012-2013 Michael Habeck <mhabeck@gwdg.de>," \ 
    about.license="Expat" \ 
    about.license_file="/usr/share/doc/csb/copyright" \ 
    about.tags="devel::lang:python, implemented-in::python, role::shared-lib" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y python-csb || apt-get install -y python-csb) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
