FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="depinfo" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="depinfo" \ 
    about.summary="retrieve and print Python 3 package dependencies" \ 
    about.home="https://github.com/Midnighter/dependency-info" \ 
    software.version="1.4.0-1-deb-py3" \ 
    upstream.version="1.4.0" \ 
    version="1" \ 
    about.copyright="2015-2018 Moritz E. Beber" \ 
    about.license="Apache-2.0" \ 
    about.license_file="/usr/share/doc/depinfo/copyright" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y python3-depinfo || apt-get install -y python3-depinfo) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
