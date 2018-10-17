FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="sqlsoup" \ 
    container="sqlsoup" \ 
    about.summary="one step database access tool for Python3, built on the SQLAlchemy ORM" \ 
    about.home="https://pypi.python.org/pypi/sqlsoup" \ 
    software.version="0.9.1-1-deb-py3" \ 
    version="1" \ 
    about.copyright="2005-2012 by Jonathan Ellis and Michael Bayer." \ 
    about.license="Expat" \ 
    about.license_file="/usr/share/doc/sqlsoup/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y python3-sqlsoup && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
