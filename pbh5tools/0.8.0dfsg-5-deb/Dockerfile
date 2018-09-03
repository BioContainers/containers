FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="pbh5tools" \ 
    container="pbh5tools" \ 
    about.summary="tools for manipulating Pacific Biosciences HDF5 files" \ 
    about.home="https://github.com/PacificBiosciences/pbh5tools" \ 
    software.version="0.8.0dfsg-5-deb" \ 
    version="1" \ 
    about.copyright="2011-2013 Pacific Biosciences of California, Inc." \ 
    about.license="PacBio-BSD-3-Clause" \ 
    about.license_file="/usr/share/doc/pbh5tools/copyright" \ 
    extra.binaries="/usr/bin/bash5tools,/usr/bin/bash5tools.py,/usr/bin/cmph5tools,/usr/bin/cmph5tools.py" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y pbh5tools && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
