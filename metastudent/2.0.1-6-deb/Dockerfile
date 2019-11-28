FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="metastudent" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="metastudent" \ 
    about.summary="predictor of Gene Ontology terms from protein sequence" \ 
    about.home="https://rostlab.org/owiki/index.php/Metastudent" \ 
    software.version="2.0.1-6-deb" \ 
    upstream.version="2.0.1" \ 
    version="1" \ 
    extra.identifiers.biotools="metastudent" \ 
    about.copyright="2010-2015, Tobias Hamp <hampt@rostlab.org>" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/metastudent/copyright" \ 
    extra.binaries="/usr/bin/metastudent" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y metastudent || apt-get install -y metastudent) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
