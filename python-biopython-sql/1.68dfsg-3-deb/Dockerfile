FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="python-biopython-sql" \ 
    container="python-biopython-sql" \ 
    about.summary="Biopython support for the BioSQL database schema (Python 2)" \ 
    about.home="http://biopython.org" \ 
    software.version="1.68dfsg-3-deb" \ 
    version="1" \ 
    about.copyright=" 2002-2009 Biopython contributors" \ 
    about.license="other" \ 
    about.license_file="/usr/share/doc/python-biopython-sql/copyright" \ 
    about.tags="devel::lang:python, devel::lang:sql, devel::library, field::biology,:python, role::devel-lib, works-with::db" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y python-biopython-sql && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
