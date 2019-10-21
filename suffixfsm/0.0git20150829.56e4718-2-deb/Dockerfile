FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="suffixfsm" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="suffixfsm" \ 
    about.summary="Go finite state machine generator for Porter2 stemmers" \ 
    about.home="https://github.com/dataence/porter2" \ 
    software.version="0.0git20150829.56e4718-2-deb" \ 
    version="1" \ 
    about.copyright="2014, 2015 Dataence, LLC <zhenjl@gmail.com>" \ 
    about.license="Apache-2.0" \ 
    about.license_file="/usr/share/doc/suffixfsm/copyright" \ 
    extra.binaries="/usr/bin/suffixfsm" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y suffixfsm || apt-get install -y suffixfsm) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
