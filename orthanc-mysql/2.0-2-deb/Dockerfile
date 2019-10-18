FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="orthanc-mysql" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="orthanc-mysql" \ 
    about.summary="Plugins to use MySQL or MariaDB as a database back-end to Orthanc" \ 
    about.home="https://www.orthanc-server.com/static.php?page=mysql" \ 
    software.version="2.0-2-deb" \ 
    upstream.version="2.0" \ 
    version="1" \ 
    about.copyright="2012-2016 Sebastien Jodogne <s.jodogne@gmail.com>, University Hospital of Liege (Belgium), and 2017-2019 Osimis S.A. (Belgium)" \ 
    about.license="AGPL-3" \ 
    about.license_file="/usr/share/doc/orthanc-mysql/copyright" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y orthanc-mysql || apt-get install -y orthanc-mysql) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
