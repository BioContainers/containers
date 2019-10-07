FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="lambda-align2" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="lambda-align2" \ 
    about.summary="Local Aligner for Massive Biological DatA - v2" \ 
    about.home="https://seqan.github.io/lambda" \ 
    software.version="2.0.0-6-deb" \ 
    upstream.version="2.0.0" \ 
    version="1" \ 
    about.copyright=" 2013-2019 Hannes Hauswedell <h2 @ fsfe.org>" \ 
    about.license="AGPL-3+" \ 
    about.license_file="/usr/share/doc/lambda-align2/copyright" \ 
    extra.binaries="/usr/bin/lambda2" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y lambda-align2 || apt-get install -y lambda-align2) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
