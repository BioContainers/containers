FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="pycorrfit" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="pycorrfit" \ 
    about.summary="tool for fitting correlation curves on a logarithmic plot" \ 
    about.home="http://fcs-analysis.github.io/PyCorrFit/" \ 
    software.version="1.1.5dfsg-1-deb" \ 
    upstream.version="1.1.5" \ 
    version="1" \ 
    about.copyright="2015 Paul Mueller <paul.mueller@biotec.tu-dresden.de>" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/pycorrfit/copyright" \ 
    extra.binaries="/usr/bin/pycorrfit" \ 
    about.tags="interface::graphical, interface::x11, role::program" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y pycorrfit || apt-get install -y pycorrfit) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
