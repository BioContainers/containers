FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="elph" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="elph" \ 
    about.summary="DNA/protein sequence motif finder" \ 
    about.home="http://www.cbcb.umd.edu/software/ELPH/" \ 
    software.version="1.0.1-2-deb" \ 
    upstream.version="1.0.1" \ 
    version="1" \ 
    about.copyright="2005 Center for Bioinformatics and Computational Biology" \ 
    about.license="Artistic-1.0" \ 
    about.license_file="/usr/share/doc/elph/copyright" \ 
    extra.binaries="/usr/bin/elph" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y elph || apt-get install -y elph) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
