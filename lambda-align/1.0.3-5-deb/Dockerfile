FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="lambda-align" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="lambda-align" \ 
    about.summary="Local Aligner for Massive Biological DatA" \ 
    about.home="https://seqan.github.io/lambda" \ 
    software.version="1.0.3-5-deb" \ 
    upstream.version="1.0.3" \ 
    version="1" \ 
    about.copyright=" 2013-2016 Hannes Hauswedell" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/lambda-align/copyright" \ 
    extra.binaries="/usr/bin/lambda,/usr/bin/lambda_indexer" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y lambda-align || apt-get install -y lambda-align) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
