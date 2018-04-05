FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="jaligner" \ 
    container="jaligner" \ 
    about.summary="Smith-Waterman algorithm with Gotoh's improvement" \ 
    about.home="https://github.com/ahmedmoustafa/JAligner" \ 
    software.version="1.0dfsg-4-deb" \ 
    version="1" \ 
    about.copyright="Ahmed Moustafa <ahmed@users.sf.net>" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/jaligner/copyright" \ 
    extra.binaries="/usr/bin/jaligner" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y jaligner && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
