FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="python-rdflib-jsonld" \ 
    container="python-rdflib-jsonld" \ 
    about.summary="rdflib extension adding JSON-LD parser and serializer in Python 2" \ 
    about.home="https://github.com/RDFLib/rdflib-jsonld" \ 
    software.version="0.4.0-2-deb" \ 
    version="1" \ 
    about.copyright="(c) 2012-2015, RDFLib Team" \ 
    about.license="BSD-3-clause" \ 
    about.license_file="/usr/share/doc/python-rdflib-jsonld/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y python-rdflib-jsonld && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
