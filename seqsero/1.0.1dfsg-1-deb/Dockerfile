FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="seqsero" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="seqsero" \ 
    about.summary="Salmonella serotyping from genome sequencing data" \ 
    about.home="https://github.com/denglab/SeqSero" \ 
    software.version="1.0.1dfsg-1-deb" \ 
    upstream.version="1.0.1" \ 
    version="1" \ 
    about.copyright="2014-2015 University of Georgia" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/seqsero/copyright" \ 
    extra.binaries="/usr/bin/seqsero,/usr/bin/seqsero_batch_pair-end" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y seqsero || apt-get install -y seqsero) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
