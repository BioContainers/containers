FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="cutadapt" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="cutadapt" \ 
    about.summary="Clean biological sequences from high-throughput sequencing reads (Python 2)" \ 
    about.home="http://pypi.python.org/pypi/cutadapt" \ 
    software.version="1.18-1-deb-py2" \ 
    upstream.version="1.18" \ 
    version="1" \ 
    about.copyright="2010-2015 Marcel Martin <marcel.martin@scilifelab.se>" \ 
    about.license="Expat" \ 
    about.license_file="/usr/share/doc/cutadapt/copyright" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y python-cutadapt || apt-get install -y python-cutadapt) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
