FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="sqt" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="sqt" \ 
    about.summary="SeQuencing Tools for biological DNA/RNA high-throughput data" \ 
    about.home="https://bitbucket.org/marcelm/sqt" \ 
    software.version="0.8.0-3-deb-py3" \ 
    upstream.version="0.8.0" \ 
    version="1" \ 
    about.copyright="2009-2014 Marcel Martin <marcel.martin@scilifelab.se>" \ 
    about.license="MIT" \ 
    about.license_file="/usr/share/doc/sqt/copyright" \ 
    extra.binaries="/usr/bin/sqt" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y python3-sqt || apt-get install -y python3-sqt) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
