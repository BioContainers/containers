FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="metastudent-data-2" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="metastudent-data-2" \ 
    about.summary="predictor of Gene Ontology terms from protein sequence - data #2" \ 
    about.home="https://rostlab.org/owiki/index.php/Metastudent" \ 
    software.version="1.0.0-4-deb" \ 
    upstream.version="1.0.0" \ 
    version="1" \ 
    about.copyright="2013, Tobias Hamp <hampt@rostlab.org>" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/metastudent-data-2/copyright" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y metastudent-data-2 || apt-get install -y metastudent-data-2) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
