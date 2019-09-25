FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="gfapy" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="gfapy" \ 
    about.summary="flexible and extensible software library for handling sequence graphs" \ 
    about.home="https://github.com/ggonnella/gfapy" \ 
    software.version="1.0.0dfsg-3-deb-py3" \ 
    upstream.version="1.0.0" \ 
    version="1" \ 
    extra.identifiers.biotools="gfapy" \ 
    about.copyright="2017 Giorgio Gonnella and CONTRIBUTORS" \ 
    about.license="ISC" \ 
    about.license_file="/usr/share/doc/gfapy/copyright" \ 
    extra.binaries="/usr/bin/gfapy-convert,/usr/bin/gfapy-mergelinear,/usr/bin/gfapy-validate" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y python3-gfapy || apt-get install -y python3-gfapy) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
