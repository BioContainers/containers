FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="multipletau" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="multipletau" \ 
    about.summary="multiple-tau algorithm for Python3/NumPy" \ 
    about.home="https://github.com/FCS-analysis/multipletau" \ 
    software.version="0.3.3ds-1-deb-py3" \ 
    upstream.version="0.3.3" \ 
    version="1" \ 
    about.copyright="2014 Paul Mueller <paul.mueller@biotec.tu-dresden.de>" \ 
    about.license="BSD-3-Clause" \ 
    about.license_file="/usr/share/doc/multipletau/copyright" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y python3-multipletau || apt-get install -y python3-multipletau) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
