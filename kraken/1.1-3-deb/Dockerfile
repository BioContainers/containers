FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="kraken" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="kraken" \ 
    about.summary="assigning taxonomic labels to short DNA sequences" \ 
    about.home="http://ccb.jhu.edu/software/kraken/" \ 
    software.version="1.1-3-deb" \ 
    upstream.version="1.1" \ 
    version="1" \ 
    extra.identifiers.biotools="kraken" \ 
    about.copyright="2013-2015 Derrick Wood <dwood@cs.jhu.edu>" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/kraken/copyright" \ 
    extra.binaries="/usr/bin/kraken,/usr/bin/kraken-build,/usr/bin/kraken-filter,/usr/bin/kraken-mpa-report,/usr/bin/kraken-report,/usr/bin/kraken-translate" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y kraken || apt-get install -y kraken) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
