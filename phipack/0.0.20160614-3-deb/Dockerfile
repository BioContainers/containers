FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="phipack" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="phipack" \ 
    about.summary="PHI test and other tests of recombination" \ 
    about.home="http://www.maths.otago.ac.nz/~dbryant/software/phimanual.pdf" \ 
    software.version="0.0.20160614-3-deb" \ 
    upstream.version="0.0.20160614" \ 
    version="1" \ 
    about.copyright="2004-2006 Trevor Bruen <tbruen@gmail.com>," \ 
    about.license="LGPL-3+" \ 
    about.license_file="/usr/share/doc/phipack/copyright" \ 
    extra.binaries="/usr/bin/phipack-phi,/usr/bin/phipack-ppma_2_bmp,/usr/bin/phipack-profile" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y phipack || apt-get install -y phipack) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
