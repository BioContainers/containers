FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="ffindex" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="ffindex" \ 
    about.summary="simple index/database for huge amounts of small files" \ 
    about.home="https://github.com/ahcm/ffindex" \ 
    software.version="0.9.9.9-2-deb" \ 
    upstream.version="0.9.9.9" \ 
    version="1" \ 
    about.copyright="2010-2018 Andreas Hauser <andy@splashground.de>" \ 
    about.license="CC-BY-SA-3.0" \ 
    about.license_file="/usr/share/doc/ffindex/copyright" \ 
    extra.binaries="/usr/bin/ffindex_apply,/usr/bin/ffindex_apply_mpi,/usr/bin/ffindex_build,/usr/bin/ffindex_from_fasta,/usr/bin/ffindex_from_tsv,/usr/bin/ffindex_get,/usr/bin/ffindex_modify,/usr/bin/ffindex_unpack" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y ffindex || apt-get install -y ffindex) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
