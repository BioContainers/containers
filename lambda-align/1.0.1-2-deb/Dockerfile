FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="lambda-align" \ 
    container="lambda-align" \ 
    about.summary="Local Aligner for Massive Biological DatA" \ 
    about.home="https://seqan.github.io/lambda" \ 
    software.version="1.0.1-2-deb" \ 
    version="1" \ 
    about.copyright=" 2013-2016 Hannes Hauswedell" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/lambda-align/copyright" \ 
    extra.binaries="/usr/bin/lambda,/usr/bin/lambda_indexer" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y lambda-align && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
