FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="jaligner" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="jaligner" \ 
    about.summary="Smith-Waterman algorithm with Gotoh's improvement" \ 
    about.home="https://github.com/ahmedmoustafa/JAligner" \ 
    software.version="1.0dfsg-6-deb" \ 
    upstream.version="1.0" \ 
    version="1" \ 
    about.copyright="Ahmed Moustafa <ahmed@users.sf.net>" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/jaligner/copyright" \ 
    extra.binaries="/usr/bin/jaligner" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y jaligner || apt-get install -y jaligner) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
