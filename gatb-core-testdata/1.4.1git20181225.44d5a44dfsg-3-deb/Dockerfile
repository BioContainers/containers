FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="gatb-core-testdata" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="gatb-core-testdata" \ 
    about.summary="Genome Analysis Toolbox with de-Bruijn graph (test data)" \ 
    about.home="https://github.com/GATB/gatb-core" \ 
    software.version="1.4.1git20181225.44d5a44dfsg-3-deb" \ 
    upstream.version="1.4.1" \ 
    version="1" \ 
    about.copyright="2014-2018 Genscale research team" \ 
    about.license="GNU-Affero-3" \ 
    about.license_file="/usr/share/doc/gatb-core-testdata/copyright" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y gatb-core-testdata || apt-get install -y gatb-core-testdata) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
