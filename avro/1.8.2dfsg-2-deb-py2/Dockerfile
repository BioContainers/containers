FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="avro" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="avro" \ 
    about.summary="Apache Avro serialization system (Python 2 library)" \ 
    about.home="http://avro.apache.org" \ 
    software.version="1.8.2dfsg-2-deb-py2" \ 
    upstream.version="1.8.2" \ 
    version="1" \ 
    about.copyright="2010-2017 Apache Software Foundation" \ 
    about.license="Apache-2.0" \ 
    about.license_file="/usr/share/doc/avro/copyright" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y python-avro || apt-get install -y python-avro) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
