FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="wigeon" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="wigeon" \ 
    about.summary="reimplementation of the Pintail 16S DNA anomaly detection utility" \ 
    about.home="http://microbiomeutil.sourceforge.net/" \ 
    software.version="20101212dfsg1-2-deb" \ 
    upstream.version="20101212" \ 
    version="1" \ 
    about.copyright=" 2009-2010 The Broad Institute <http://www.broadinstitute.org>" \ 
    about.license="BSD-3-clause" \ 
    about.license_file="/usr/share/doc/wigeon/copyright" \ 
    extra.binaries="/usr/bin/cm_to_wigeon,/usr/bin/wigeon" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y wigeon || apt-get install -y wigeon) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
