FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="schema-salad" \ 
    container="schema-salad" \ 
    about.summary="Schema Annotations for Linked Avro Data (SALAD)" \ 
    about.home="http://www.commonwl.org" \ 
    software.version="2.2.20170111180227-1-deb-py2" \ 
    version="1" \ 
    about.copyright="2015-2016 Peter Amstutz" \ 
    about.license="Apache-2.0" \ 
    about.license_file="/usr/share/doc/schema-salad/copyright" \ 
    extra.binaries="/usr/bin/schema-salad-tool" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y python-schema-salad && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
