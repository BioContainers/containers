FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="pbh5tools" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="pbh5tools" \ 
    about.summary="tools for manipulating Pacific Biosciences HDF5 files -- Python 2 library" \ 
    about.home="https://github.com/PacificBiosciences/pbh5tools" \ 
    software.version="0.8.0git20170929.58d54ffdfsg-1-deb-py2" \ 
    upstream.version="0.8.0" \ 
    version="1" \ 
    about.copyright="2011-2013 Pacific Biosciences of California, Inc." \ 
    about.license="PacBio-BSD-3-Clause" \ 
    about.license_file="/usr/share/doc/pbh5tools/copyright" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y python-pbh5tools || apt-get install -y python-pbh5tools) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
