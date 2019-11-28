FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="autogrid-test" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="autogrid-test" \ 
    about.summary="test files for AutoGrid" \ 
    about.home="http://autodock.scripps.edu/" \ 
    software.version="4.2.6-6-deb" \ 
    upstream.version="4.2.6" \ 
    version="1" \ 
    about.copyright="1989-2014, All Rights Reserved." \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/autogrid-test/copyright" \ 
    about.tags="field::biology, field::biology:structural, made-of::TODO,:dictionary, role::TODO, role::app-data, use::TODO,:checking" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y autogrid-test || apt-get install -y autogrid-test) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
