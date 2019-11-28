FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="rdflib-jsonld" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="rdflib-jsonld" \ 
    about.summary="rdflib extension adding JSON-LD parser and serializer in Python 3" \ 
    about.home="https://github.com/RDFLib/rdflib-jsonld" \ 
    software.version="0.4.0-4-deb-py3" \ 
    upstream.version="0.4.0" \ 
    version="1" \ 
    about.copyright="(c) 2012-2015, RDFLib Team" \ 
    about.license="BSD-3-clause" \ 
    about.license_file="/usr/share/doc/rdflib-jsonld/copyright" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y python3-rdflib-jsonld || apt-get install -y python3-rdflib-jsonld) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
