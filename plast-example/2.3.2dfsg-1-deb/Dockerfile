FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="plast-example" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="plast-example" \ 
    about.summary="Parallel Local Sequence Alignment Search Tool (example data)" \ 
    about.home="https://plast.inria.fr/" \ 
    software.version="2.3.2dfsg-1-deb" \ 
    upstream.version="2.3.2" \ 
    version="1" \ 
    extra.identifiers.biotools="plast" \ 
    about.copyright="2009-2015 Van Hoa Nguyen <nvhoa@agu.edu.vn>" \ 
    about.license="AGPL-3" \ 
    about.license_file="/usr/share/doc/plast-example/copyright" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y plast-example || apt-get install -y plast-example) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
