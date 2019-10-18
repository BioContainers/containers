FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="mypy-extensions" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="mypy-extensions" \ 
    about.summary="Experimental type system extensions for mypy typechecker (Python 3)" \ 
    about.home="http://www.mypy-lang.org/" \ 
    software.version="0.4.1-1-deb-py3" \ 
    upstream.version="0.4.1" \ 
    version="1" \ 
    about.copyright=" 2016-2017 Jukka Lehtosalo and contributors" \ 
    about.license="Expat" \ 
    about.license_file="/usr/share/doc/mypy-extensions/copyright" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y python3-mypy-extensions || apt-get install -y python3-mypy-extensions) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
