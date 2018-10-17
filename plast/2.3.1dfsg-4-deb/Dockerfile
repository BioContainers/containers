FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="plast" \ 
    container="plast" \ 
    about.summary="Parallel Local Sequence Alignment Search Tool" \ 
    about.home="https://plast.inria.fr/" \ 
    software.version="2.3.1dfsg-4-deb" \ 
    version="1" \ 
    extra.identifiers.biotools="plast" \ 
    about.copyright="2009-2015 Van Hoa Nguyen <nvhoa@agu.edu.vn>" \ 
    about.license="AGPL-3" \ 
    about.license_file="/usr/share/doc/plast/copyright" \ 
    extra.binaries="/usr/bin/plast" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y plast && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
