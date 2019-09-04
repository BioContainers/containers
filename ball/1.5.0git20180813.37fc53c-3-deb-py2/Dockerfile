FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="ball" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="ball" \ 
    about.summary="Python bindings for the Biochemical Algorithms Library" \ 
    about.home="http://www.ball-project.org/" \ 
    software.version="1.5.0git20180813.37fc53c-3-deb-py2" \ 
    upstream.version="1.5.0" \ 
    version="1" \ 
    about.copyright=" 1998-2013 the BALL project group" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/ball/copyright" \ 
    about.tags="uitoolkit::qt" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y python-ball || apt-get install -y python-ball) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
