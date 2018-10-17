FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="mypy" \ 
    container="mypy" \ 
    about.summary="Optional static typing for Python" \ 
    about.home="http://www.mypy-lang.org/" \ 
    software.version="0.470-complete-1-deb" \ 
    version="1" \ 
    about.copyright=" 2015-2016 Jukka Lehtosalo and contributors" \ 
    about.license="MIT" \ 
    about.license_file="/usr/share/doc/mypy/copyright" \ 
    extra.binaries="/usr/bin/mypy,/usr/bin/stubgen" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y mypy && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
