FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="fastml" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="fastml" \ 
    about.summary="maximum likelihood ancestral amino-acid sequence reconstruction" \ 
    about.home="http://fastml.tau.ac.il/" \ 
    software.version="3.1-4-deb" \ 
    upstream.version="3.1" \ 
    version="1" \ 
    extra.identifiers.biotools="fastml" \ 
    about.copyright="1996-2014 Tal Pupko <talp@post.tau.ac.il>" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/fastml/copyright" \ 
    extra.binaries="/usr/bin/fastml,/usr/bin/gainLoss,/usr/bin/indelCoder" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y fastml || apt-get install -y fastml) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
