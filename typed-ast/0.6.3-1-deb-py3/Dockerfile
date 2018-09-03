FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="typed-ast" \ 
    container="typed-ast" \ 
    about.summary="AST with PEP 484 type comments support" \ 
    about.home="http://www.mypy-lang.org/" \ 
    software.version="0.6.3-1-deb-py3" \ 
    version="1" \ 
    about.copyright=" 2016 David Fisher <ddfisher@dropbox.com>" \ 
    about.license="Apache-2.0" \ 
    about.license_file="/usr/share/doc/typed-ast/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y python3-typed-ast && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
