FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="pycorrfit" \ 
    container="pycorrfit" \ 
    about.summary="tool for fitting correlation curves on a logarithmic plot" \ 
    about.home="http://paulmueller.github.io/PyCorrFit" \ 
    software.version="0.9.9dfsg-2-deb" \ 
    version="1" \ 
    about.copyright="2015 Paul Mueller <paul.mueller@biotec.tu-dresden.de>" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/pycorrfit/copyright" \ 
    extra.binaries="/usr/bin/pycorrfit" \ 
    about.tags="interface::graphical" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y pycorrfit && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
