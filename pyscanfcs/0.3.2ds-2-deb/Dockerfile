FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="pyscanfcs" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="pyscanfcs" \ 
    about.summary="scientific tool for perpendicular line scanning FCS" \ 
    about.home="https://fcs-analysis.github.io/PyScanFCS/" \ 
    software.version="0.3.2ds-2-deb" \ 
    upstream.version="0.3.2" \ 
    version="1" \ 
    about.copyright="2013 Paul Mueller <paul.mueller@biotec.tu-dresden.de>" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/pyscanfcs/copyright" \ 
    extra.binaries="/usr/bin/pyscanfcs" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y pyscanfcs || apt-get install -y pyscanfcs) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
