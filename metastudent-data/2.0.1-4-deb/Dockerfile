FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="metastudent-data" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="metastudent-data" \ 
    about.summary="predictor of Gene Ontology terms from protein sequence - data files" \ 
    about.home="https://rostlab.org/owiki/index.php/Metastudent" \ 
    software.version="2.0.1-4-deb" \ 
    upstream.version="2.0.1" \ 
    version="1" \ 
    about.copyright="2011-2015, Tobias Hamp <hampt@rostlab.org>" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/metastudent-data/copyright" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y metastudent-data || apt-get install -y metastudent-data) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
