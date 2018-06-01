FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="phipack" \ 
    container="phipack" \ 
    about.summary="PHI test and other tests of recombination" \ 
    about.home="http://www.maths.otago.ac.nz/~dbryant/software/phimanual.pdf" \ 
    software.version="0.0.20160614-2-deb" \ 
    version="1" \ 
    about.copyright="2004-2006 Trevor Bruen <tbruen@gmail.com>," \ 
    about.license="LGPL-3+" \ 
    about.license_file="/usr/share/doc/phipack/copyright" \ 
    extra.binaries="/usr/bin/phipack-phi,/usr/bin/phipack-ppma_2_bmp,/usr/bin/phipack-profile" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y phipack && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
