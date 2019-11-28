FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="orthanc-postgresql" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="orthanc-postgresql" \ 
    about.summary="Plugins to use PostgreSQL as a database back-end to Orthanc" \ 
    about.home="https://www.orthanc-server.com/static.php?page=postgresql" \ 
    software.version="3.2-1-deb" \ 
    upstream.version="3.2" \ 
    version="1" \ 
    about.copyright="2012-2016 Sebastien Jodogne <s.jodogne@gmail.com>, University Hospital of Liege (Belgium), and 2017-2019 Osimis S.A. (Belgium)" \ 
    about.license="AGPL-3" \ 
    about.license_file="/usr/share/doc/orthanc-postgresql/copyright" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y orthanc-postgresql || apt-get install -y orthanc-postgresql) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
