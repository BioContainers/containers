FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="mlv-smile" \ 
    container="mlv-smile" \ 
    about.summary="Find statistically significant patterns in sequences" \ 
    about.home="http://www-igm.univ-mlv.fr/~marsan/smile_english.html" \ 
    software.version="1.47-4b1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/mlv-smile/copyright" \ 
    extra.binaries="/usr/bin/mlv-smile" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y mlv-smile && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
