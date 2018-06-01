FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="mne" \ 
    container="mne" \ 
    about.summary="Python modules for MEG and EEG data analysis" \ 
    about.home="http://martinos.org/mne" \ 
    software.version="0.13.1dfsg-3-deb-py2" \ 
    version="1" \ 
    about.copyright="2010-2016, MNE-Python Developers" \ 
    about.license="BSD-3-Clause" \ 
    about.license_file="/usr/share/doc/mne/copyright" \ 
    extra.binaries="/usr/bin/mne" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y python-mne && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
