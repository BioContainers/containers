FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="kraken" \ 
    container="kraken" \ 
    about.summary="assigning taxonomic labels to short DNA sequences" \ 
    about.home="http://ccb.jhu.edu/software/kraken/" \ 
    software.version="0.10.5beta-2b1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/kraken/copyright" \ 
    extra.binaries="/usr/bin/kraken,/usr/bin/kraken-build,/usr/bin/kraken-filter,/usr/bin/kraken-mpa-report,/usr/bin/kraken-report,/usr/bin/kraken-translate" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y kraken && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
