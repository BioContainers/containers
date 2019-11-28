FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="kineticstools" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="kineticstools" \ 
    about.summary="detection of DNA modifications (Python 2 library)" \ 
    about.home="https://github.com/PacificBiosciences/kineticsTools" \ 
    software.version="0.6.1git20180425.27a1878-2-deb-py2" \ 
    upstream.version="0.6.1" \ 
    version="1" \ 
    about.copyright="" \ 
    about.license="PacBio-BSD-3-Clause" \ 
    about.license_file="/usr/share/doc/kineticstools/copyright" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y python-kineticstools || apt-get install -y python-kineticstools) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
