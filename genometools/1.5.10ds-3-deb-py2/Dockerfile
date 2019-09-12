FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="genometools" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="genometools" \ 
    about.summary="Python bindings for genometools" \ 
    about.home="http://genometools.org" \ 
    software.version="1.5.10ds-3-deb-py2" \ 
    upstream.version="1.5.10" \ 
    version="1" \ 
    extra.identifiers.biotools="genometools" \ 
    about.license="custom, see /usr/share/doc/genometools/copyright" \ 
    about.license_file="/usr/share/doc/genometools/copyright" \ 
    about.tags="devel::lang:python, devel::library, implemented-in::python,:devel-lib" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y python-genometools || apt-get install -y python-genometools) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
