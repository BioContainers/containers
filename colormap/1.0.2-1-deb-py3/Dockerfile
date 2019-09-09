FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="colormap" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="colormap" \ 
    about.summary="ease manipulation of matplotlib colormaps and color codecs (Python 3)" \ 
    about.home="https://colormap.readthedocs.io/" \ 
    software.version="1.0.2-1-deb-py3" \ 
    upstream.version="1.0.2" \ 
    version="1" \ 
    about.copyright="2014 Thomas Cokelaer <cokelaer@gmail.com>" \ 
    about.license="BSD-3-Clause/colormap" \ 
    about.license_file="/usr/share/doc/colormap/copyright" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y python3-colormap || apt-get install -y python3-colormap) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
