FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="avro" \ 
    container="avro" \ 
    about.summary="Apache Avro serialization system ?? Python 3 library" \ 
    about.home="http://avro.apache.org" \ 
    software.version="1.8.1dfsg-1-deb-py3" \ 
    version="1" \ 
    about.copyright="2010-2015 Apache Software Foundation" \ 
    about.license="Apache-2.0" \ 
    about.license_file="/usr/share/doc/avro/copyright" \ 
    extra.binaries="/usr/bin/avro" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y python3-avro && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
