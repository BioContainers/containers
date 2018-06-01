FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="pbcommand" \ 
    container="pbcommand" \ 
    about.summary="common command-line interface for Pacific Biosciences analysis modules" \ 
    about.home="https://pbcommand.readthedocs.org/en/latest/" \ 
    software.version="0.5.3-1-deb-py2" \ 
    version="1" \ 
    about.copyright="2011-2016 Pacific Biosciences of California, Inc. <devnet@pacificbiosciences.com>" \ 
    about.license="PacBio-BSD-3-Clause" \ 
    about.license_file="/usr/share/doc/pbcommand/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y python-pbcommand && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
