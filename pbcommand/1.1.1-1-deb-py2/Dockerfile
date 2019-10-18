FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="pbcommand" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="pbcommand" \ 
    about.summary="common command-line interface for Pacific Biosciences analysis modules" \ 
    about.home="https://pbcommand.readthedocs.org/en/latest/" \ 
    software.version="1.1.1-1-deb-py2" \ 
    upstream.version="1.1.1" \ 
    version="1" \ 
    about.copyright="2011-2016 Pacific Biosciences of California, Inc. <devnet@pacificbiosciences.com>" \ 
    about.license="PacBio-BSD-3-Clause" \ 
    about.license_file="/usr/share/doc/pbcommand/copyright" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y python-pbcommand || apt-get install -y python-pbcommand) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
