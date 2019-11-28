FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="biom-format" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="biom-format" \ 
    about.summary="Biological Observation Matrix (BIOM) format (Python 2)" \ 
    about.home="http://biom-format.org/" \ 
    software.version="2.1.7dfsg-2-deb-py2" \ 
    upstream.version="2.1.7" \ 
    version="1" \ 
    about.copyright=" 2010-2015 Greg Caporaso <gregcaporaso@gmail.com>" \ 
    about.license="GPL" \ 
    about.license_file="/usr/share/doc/biom-format/copyright" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y python-biom-format || apt-get install -y python-biom-format) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
