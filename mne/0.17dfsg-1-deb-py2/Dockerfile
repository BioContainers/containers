FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="mne" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="mne" \ 
    about.summary="Python modules for MEG and EEG data analysis" \ 
    about.home="http://martinos.org/mne" \ 
    software.version="0.17dfsg-1-deb-py2" \ 
    upstream.version="0.17" \ 
    version="1" \ 
    about.copyright="2010-2016, MNE-Python Developers" \ 
    about.license="BSD-3-Clause" \ 
    about.license_file="/usr/share/doc/mne/copyright" \ 
    extra.binaries="/usr/bin/mne" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y python-mne || apt-get install -y python-mne) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
