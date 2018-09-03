FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="dascrubber" \ 
    container="dascrubber" \ 
    about.summary="alignment-based scrubbing pipeline for DNA sequencing reads" \ 
    about.home="https://dazzlerblog.wordpress.com/" \ 
    software.version="020160601-2-deb" \ 
    version="1" \ 
    about.copyright="2014-2016 Eugene W. Myers, Jr. <gene.myers@gmail.com>" \ 
    about.license="BSD-3-Clause-EWM" \ 
    about.license_file="/usr/share/doc/dascrubber/copyright" \ 
    extra.binaries="/usr/bin/DASqv,/usr/bin/DAStrim" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y dascrubber && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
