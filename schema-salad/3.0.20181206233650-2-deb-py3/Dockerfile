FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="schema-salad" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="schema-salad" \ 
    about.summary="Schema Annotations for Linked Avro Data (SALAD)" \ 
    about.home="http://www.commonwl.org" \ 
    software.version="3.0.20181206233650-2-deb-py3" \ 
    upstream.version="3.0.20181206233650" \ 
    version="1" \ 
    about.copyright="2015-2016 Peter Amstutz" \ 
    about.license="Apache-2.0" \ 
    about.license_file="/usr/share/doc/schema-salad/copyright" \ 
    extra.binaries="/usr/bin/schema-salad-doc,/usr/bin/schema-salad-tool" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y python3-schema-salad || apt-get install -y python3-schema-salad) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
