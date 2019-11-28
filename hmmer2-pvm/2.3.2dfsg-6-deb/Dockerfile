FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="hmmer2-pvm" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="hmmer2-pvm" \ 
    about.summary="HMMER programs with PVM (Parallel Virtual Machine) support" \ 
    about.home="http://hmmer.janelia.org/" \ 
    software.version="2.3.2dfsg-6-deb" \ 
    upstream.version="2.3.2" \ 
    version="1" \ 
    extra.identifiers.biotools="hmmer2" \ 
    about.copyright="Copyright (C) 1992-2003 HHMI/Washington University School of Medicine" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/hmmer2-pvm/copyright" \ 
    extra.binaries="/usr/bin/hmm2calibrate-pvm,/usr/bin/hmm2pfam-pvm,/usr/bin/hmm2search-pvm" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y hmmer2-pvm || apt-get install -y hmmer2-pvm) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
