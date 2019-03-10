FROM biocontainers/biocontainers:debian-stretch-backports_cv2
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="unicycler-data" \ 
    base_image="biocontainers/biocontainers:debian-stretch-backports_cv2" \ 
    container="unicycler-data" \ 
    about.summary="hybrid assembly pipeline for bacterial genomes (data package)" \ 
    about.home="https://github.com/rrwick/Unicycler" \ 
    software.version="0.4.7dfsg-1bpo91-deb" \ 
    upstream.version="0.4.7" \ 
    version="2" \ 
    extra.identifiers.biotools="unicycler" \ 
    about.license="custom, see /usr/share/doc/unicycler-data/copyright" \ 
    about.license_file="/usr/share/doc/unicycler-data/copyright" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -t stretch-backports -y unicycler-data && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
