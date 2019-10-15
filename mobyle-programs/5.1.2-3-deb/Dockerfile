FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="mobyle-programs" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="mobyle-programs" \ 
    about.summary="program descriptions for the mobyle portal" \ 
    about.home="https://projets.pasteur.fr/projects/show/mobyle" \ 
    software.version="5.1.2-3-deb" \ 
    upstream.version="5.1.2" \ 
    version="1" \ 
    about.copyright="2011 Herve Menager <hmenager@pasteur.fr>" \ 
    about.license="LGPL-2+" \ 
    about.license_file="/usr/share/doc/mobyle-programs/copyright" \ 
    about.tags="devel::examples, field::biology, field::biology:bioinformatics,:examples" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y mobyle-programs || apt-get install -y mobyle-programs) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
