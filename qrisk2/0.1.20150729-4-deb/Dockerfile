FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="qrisk2" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="qrisk2" \ 
    about.summary="cardiovascular disease risk calculator" \ 
    about.home="http://qrisk.org/" \ 
    software.version="0.1.20150729-4-deb" \ 
    upstream.version="0.1.20150729" \ 
    version="1" \ 
    about.copyright=" 2008-2012 ClinRisk Ltd." \ 
    about.license="LGPL-3+" \ 
    about.license_file="/usr/share/doc/qrisk2/copyright" \ 
    extra.binaries="/usr/bin/Q80_model_4_0_commandLine,/usr/bin/Q80_model_4_1_commandLine" \ 
    about.tags="field::medicine, interface::graphical, interface::x11, role::program,:checking, x11::application" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y qrisk2 || apt-get install -y qrisk2) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
