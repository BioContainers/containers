FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="ffindex" \ 
    container="ffindex" \ 
    about.summary="simple index/database for huge amounts of small files" \ 
    about.home="http://www.splashground.de/~andy/programs/FFindex/" \ 
    software.version="0.9.9.7-3-deb" \ 
    version="1" \ 
    about.copyright="Andreas Hauser <hauser@genzentrum.lmu.de>" \ 
    about.license="CC-BY-SA-3.0" \ 
    about.license_file="/usr/share/doc/ffindex/copyright" \ 
    extra.binaries="/usr/bin/ffindex_apply,/usr/bin/ffindex_apply_mpi,/usr/bin/ffindex_build,/usr/bin/ffindex_from_fasta,/usr/bin/ffindex_from_tsv,/usr/bin/ffindex_get,/usr/bin/ffindex_modify,/usr/bin/ffindex_unpack" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y ffindex && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
