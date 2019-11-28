FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="dascrubber" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="dascrubber" \ 
    about.summary="alignment-based scrubbing pipeline for DNA sequencing reads" \ 
    about.home="https://dazzlerblog.wordpress.com/" \ 
    software.version="1.1-1-deb" \ 
    upstream.version="1.1" \ 
    version="1" \ 
    about.copyright="2014-2018 Eugene W. Myers, Jr. <gene.myers@gmail.com>" \ 
    about.license="BSD-3-Clause-EWM" \ 
    about.license_file="/usr/share/doc/dascrubber/copyright" \ 
    extra.binaries="/usr/bin/DAScover,/usr/bin/DASedit,/usr/bin/DASmap,/usr/bin/DASpatch,/usr/bin/DASqv,/usr/bin/DASrealign,/usr/bin/DAStrim,/usr/bin/REPcover,/usr/bin/REPqv,/usr/bin/REPtrim" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y dascrubber || apt-get install -y dascrubber) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
