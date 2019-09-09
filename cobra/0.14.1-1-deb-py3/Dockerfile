FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="cobra" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="cobra" \ 
    about.summary="constraint-based modeling of biological networks with Python 3" \ 
    about.home="http://opencobra.github.io/cobrapy/" \ 
    software.version="0.14.1-1-deb-py3" \ 
    upstream.version="0.14.1" \ 
    version="1" \ 
    about.copyright="" \ 
    about.license="GPL-2+ or LGPL-2.0+" \ 
    about.license_file="/usr/share/doc/cobra/copyright" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y python3-cobra || apt-get install -y python3-cobra) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
