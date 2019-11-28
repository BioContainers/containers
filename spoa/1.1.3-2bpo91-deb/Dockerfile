FROM biocontainers/biocontainers:vdebian-stretch-backports_cv2
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="spoa" \ 
    base_image="biocontainers/biocontainers:vdebian-stretch-backports_cv2" \ 
    container="spoa" \ 
    about.summary="SIMD partial order alignment tool" \ 
    about.home="https://github.com/rvaser/spoa" \ 
    software.version="1.1.3-2bpo91-deb" \ 
    upstream.version="1.1.3" \ 
    version="1" \ 
    about.license="custom, see /usr/share/doc/spoa/copyright" \ 
    about.license_file="/usr/share/doc/spoa/copyright" \ 
    extra.binaries="/usr/bin/spoa" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y spoa && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
