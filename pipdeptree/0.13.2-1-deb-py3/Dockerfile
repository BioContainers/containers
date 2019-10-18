FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="pipdeptree" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="pipdeptree" \ 
    about.summary="display dependency tree of the installed Python 3 packages" \ 
    about.home="https://github.com/naiquevin/pipdeptree" \ 
    software.version="0.13.2-1-deb-py3" \ 
    upstream.version="0.13.2" \ 
    version="1" \ 
    about.copyright="2015-2018 Vineet Naik" \ 
    about.license="MIT" \ 
    about.license_file="/usr/share/doc/pipdeptree/copyright" \ 
    extra.binaries="/usr/bin/pipdeptree" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y python3-pipdeptree || apt-get install -y python3-pipdeptree) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
