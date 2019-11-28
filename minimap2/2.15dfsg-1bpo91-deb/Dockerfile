FROM biocontainers/biocontainers:debian-stretch-backports_cv2
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="minimap2" \ 
    base_image="biocontainers/biocontainers:debian-stretch-backports_cv2" \ 
    container="minimap2" \ 
    about.summary="versatile pairwise aligner for genomic and spliced nucleotide sequences" \ 
    about.home="https://github.com/lh3/minimap2" \ 
    software.version="2.15dfsg-1bpo91-deb" \ 
    upstream.version="2.15" \ 
    version="1" \ 
    extra.identifiers.biotools="minimap2" \ 
    about.license="custom, see /usr/share/doc/minimap2/copyright" \ 
    about.license_file="/usr/share/doc/minimap2/copyright" \ 
    extra.binaries="/usr/bin/minimap2" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y minimap2 && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
