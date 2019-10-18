FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="mypy" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="mypy" \ 
    about.summary="public modules for mypy (Python 3)" \ 
    about.home="http://www.mypy-lang.org/" \ 
    software.version="0.670-2-deb-py3" \ 
    upstream.version="0.670" \ 
    version="1" \ 
    about.copyright=" 2015-2016 Jukka Lehtosalo and contributors" \ 
    about.license="Expat" \ 
    about.license_file="/usr/share/doc/mypy/copyright" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y python3-mypy || apt-get install -y python3-mypy) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
