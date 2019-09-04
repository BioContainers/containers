FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="ballview" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="ballview" \ 
    about.summary="free molecular modeling and molecular graphics tool" \ 
    about.home="http://www.ball-project.org/" \ 
    software.version="1.5.0git20180813.37fc53c-3-deb" \ 
    upstream.version="1.5.0" \ 
    version="1" \ 
    about.copyright=" 1998-2013 the BALL project group" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/ballview/copyright" \ 
    extra.binaries="/usr/bin/BALLView" \ 
    about.tags="interface::graphical, interface::x11, role::program, uitoolkit::qt,:application" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y ballview || apt-get install -y ballview) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
