FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="mlv-smile" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="mlv-smile" \ 
    about.summary="Find statistically significant patterns in sequences" \ 
    about.home="http://www-igm.univ-mlv.fr/~marsan/smile_english.html" \ 
    software.version="1.47-6-deb" \ 
    upstream.version="1.47" \ 
    version="1" \ 
    about.copyright=" 2004 L.Marsan (lama@prism.uvsq.fr)" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/mlv-smile/copyright" \ 
    extra.binaries="/usr/bin/mlv-smile" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y mlv-smile || apt-get install -y mlv-smile) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
