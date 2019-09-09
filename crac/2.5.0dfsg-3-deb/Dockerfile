FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="crac" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="crac" \ 
    about.summary="integrated RNA-Seq read analysis" \ 
    about.home="http://crac.gforge.inria.fr/" \ 
    software.version="2.5.0dfsg-3-deb" \ 
    upstream.version="2.5.0" \ 
    version="1" \ 
    extra.identifiers.biotools="crac" \ 
    about.copyright=" 2012-2014 by Nicolas PHILIPPE <nicolas.philippe@lirmm.fr>" \ 
    about.license="CeCILL" \ 
    about.license_file="/usr/share/doc/crac/copyright" \ 
    extra.binaries="/usr/bin/crac,/usr/bin/crac-client,/usr/bin/crac-index" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y crac || apt-get install -y crac) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
