FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="sprai" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="sprai" \ 
    about.summary="single-pass sequencing read accuracy improver" \ 
    about.home="http://zombie.cb.k.u-tokyo.ac.jp/sprai/index.html" \ 
    software.version="0.9.9.23dfsg-2-deb" \ 
    upstream.version="0.9.9.23" \ 
    version="1" \ 
    about.copyright="2013-2016 Takamasa Imai" \ 
    about.license="MIT" \ 
    about.license_file="/usr/share/doc/sprai/copyright" \ 
    extra.binaries="/usr/bin/ezez4makefile_v4,/usr/bin/ezez4makefile_v4.pl,/usr/bin/ezez4qsub_vx1,/usr/bin/ezez4qsub_vx1.pl,/usr/bin/ezez_vx1,/usr/bin/ezez_vx1.pl" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y sprai || apt-get install -y sprai) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
