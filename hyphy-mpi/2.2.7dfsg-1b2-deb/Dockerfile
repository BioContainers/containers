FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="hyphy-mpi" \ 
    container="hyphy-mpi" \ 
    about.summary="Hypothesis testing using Phylogenies (MPI version)" \ 
    about.home="http://hyphy.org/" \ 
    software.version="2.2.7dfsg-1b2-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/hyphy-mpi/copyright" \ 
    extra.binaries="/usr/bin/hyphympi" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y hyphy-mpi && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
