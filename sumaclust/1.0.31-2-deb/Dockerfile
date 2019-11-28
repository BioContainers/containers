FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="sumaclust" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="sumaclust" \ 
    about.summary="fast and exact clustering of genomic sequences" \ 
    about.home="http://metabarcoding.org/sumaclust" \ 
    software.version="1.0.31-2-deb" \ 
    upstream.version="1.0.31" \ 
    version="1" \ 
    about.copyright="2013-2015 Tiayyba Riaz" \ 
    about.license="CeCILL-2" \ 
    about.license_file="/usr/share/doc/sumaclust/copyright" \ 
    extra.binaries="/usr/bin/sumaclust" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y sumaclust || apt-get install -y sumaclust) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
