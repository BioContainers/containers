FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="hmmer2" \ 
    container="hmmer2" \ 
    about.summary="profile hidden Markov models for protein sequence analysis" \ 
    about.home="http://hmmer.janelia.org/" \ 
    software.version="2.3.2-13-deb" \ 
    version="1" \ 
    about.copyright="Copyright (C) 1992-2003 HHMI/Washington University School of Medicine" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/hmmer2/copyright" \ 
    extra.binaries="/usr/bin/hmm2align,/usr/bin/hmm2build,/usr/bin/hmm2calibrate,/usr/bin/hmm2convert,/usr/bin/hmm2emit,/usr/bin/hmm2fetch,/usr/bin/hmm2index,/usr/bin/hmm2pfam,/usr/bin/hmm2search" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y hmmer2 && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
