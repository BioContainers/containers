FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="fw4spl" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="fw4spl" \ 
    about.summary="FrameWork for Software Production Line" \ 
    about.home="https://fw4spl-org.github.io/" \ 
    software.version="17.2.0-2-deb" \ 
    upstream.version="17.2.0" \ 
    version="1" \ 
    about.copyright="2009-2017 IRCAD" \ 
    about.license="LGPL-2+" \ 
    about.license_file="/usr/share/doc/fw4spl/copyright" \ 
    extra.binaries="/usr/bin/fwlauncher,/usr/bin/fwlauncher-0.1,/usr/bin/vrrender" \ 
    about.tags="uitoolkit::qt" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y fw4spl || apt-get install -y fw4spl) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
