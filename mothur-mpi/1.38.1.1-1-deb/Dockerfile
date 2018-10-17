FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="mothur-mpi" \ 
    container="mothur-mpi" \ 
    about.summary="mpi-enabled binary for mothur" \ 
    about.home="http://www.mothur.org" \ 
    software.version="1.38.1.1-1-deb" \ 
    version="1" \ 
    about.copyright=" 2009-2012 Schloss Lab UMASS Amhers., Patrick Schloss <pschloss@umich.edu>" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/mothur-mpi/copyright" \ 
    extra.binaries="/usr/bin/mothur-mpi" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y mothur-mpi && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
