FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="hmmer2-pvm" \ 
    container="hmmer2-pvm" \ 
    about.summary="HMMER programs with PVM (Parallel Virtual Machine) support" \ 
    about.home="http://hmmer.janelia.org/" \ 
    software.version="2.3.2-13-deb" \ 
    version="1" \ 
    about.copyright="Copyright (C) 1992-2003 HHMI/Washington University School of Medicine" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/hmmer2-pvm/copyright" \ 
    extra.binaries="/usr/bin/hmm2calibrate-pvm,/usr/bin/hmm2pfam-pvm,/usr/bin/hmm2search-pvm" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y hmmer2-pvm && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
