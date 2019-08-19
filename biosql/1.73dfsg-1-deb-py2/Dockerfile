FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="biosql" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="biosql" \ 
    about.summary="Biopython support for the BioSQL database schema (Python 2)" \ 
    about.home="http://biopython.org" \ 
    software.version="1.73dfsg-1-deb-py2" \ 
    upstream.version="1.73" \ 
    version="1" \ 
    about.copyright=" 2002-2009 Biopython contributors" \ 
    about.license="other" \ 
    about.license_file="/usr/share/doc/biosql/copyright" \ 
    about.tags="devel::lang:python, devel::lang:sql, devel::library, field::biology,:python, role::devel-lib, works-with::db" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y python-biopython-sql || apt-get install -y python-biopython-sql) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
