FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="crac" \ 
    container="crac" \ 
    about.summary="integrated RNA-Seq read analysis" \ 
    about.home="http://crac.gforge.inria.fr/" \ 
    software.version="2.5.0dfsg-1-deb" \ 
    version="1" \ 
    extra.identifiers.biotools="crac" \ 
    about.copyright=" 2012-2014 by Nicolas PHILIPPE <nicolas.philippe@lirmm.fr>" \ 
    about.license="CeCILL" \ 
    about.license_file="/usr/share/doc/crac/copyright" \ 
    extra.binaries="/usr/bin/crac,/usr/bin/crac-client,/usr/bin/crac-index" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y crac && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
