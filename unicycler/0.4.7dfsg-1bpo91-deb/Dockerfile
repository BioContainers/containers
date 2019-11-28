FROM biocontainers/biocontainers:debian-stretch-backports_cv2
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="unicycler" \ 
    base_image="biocontainers/biocontainers:debian-stretch-backports_cv2" \ 
    container="unicycler" \ 
    about.summary="hybrid assembly pipeline for bacterial genomes" \ 
    about.home="https://github.com/rrwick/Unicycler" \ 
    software.version="0.4.7dfsg-1bpo91-deb" \ 
    upstream.version="0.4.7" \ 
    version="2" \ 
    extra.identifiers.biotools="unicycler" \ 
    about.license="custom, see /usr/share/doc/unicycler/copyright" \ 
    about.license_file="/usr/share/doc/unicycler/copyright" \ 
    extra.binaries="/usr/bin/unicycler,/usr/bin/unicycler_align,/usr/bin/unicycler_check,/usr/bin/unicycler_polish,/usr/bin/unicycler_scrub" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -t stretch-backports -y unicycler && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
