FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="seqsero" \ 
    base_image="biocontainers/biocontainers:debian-stretch-backports" \
    container="seqsero" \ 
    about.summary="Salmonella serotyping from genome sequencing data" \ 
    about.home="https://github.com/denglab/SeqSero" \ 
    software.version="1.0-2bpo91-deb" \ 
    version="1" \ 
    about.license="custom, see /usr/share/doc/seqsero/copyright" \
    about.license_file="/usr/share/doc/seqsero/copyright" \ 
    extra.binaries="/usr/bin/seqsero,/usr/bin/seqsero_batch_pair-end" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y seqsero && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
