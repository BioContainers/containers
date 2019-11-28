FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="hhsuite" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="hhsuite" \ 
    about.summary="sensitive protein sequence searching based on HMM-HMM alignment" \ 
    about.home="https://toolkit.tuebingen.mpg.de/" \ 
    software.version="3.0beta3dfsg-3-deb" \ 
    version="1" \ 
    about.copyright="2006, 2012 Johannes Soeding" \ 
    about.license="GPL-3.0+" \ 
    about.license_file="/usr/share/doc/hhsuite/copyright" \ 
    extra.binaries="/usr/bin/hhalign,/usr/bin/hhblits,/usr/bin/hhblits_omp,/usr/bin/hhconsensus,/usr/bin/hhfilter,/usr/bin/hhmake,/usr/bin/hhsearch" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y hhsuite || apt-get install -y hhsuite) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
