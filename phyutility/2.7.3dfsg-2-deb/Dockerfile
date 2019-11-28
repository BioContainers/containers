FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="phyutility" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="phyutility" \ 
    about.summary="simple analyses or modifications on both phylogenetic trees and data matrices" \ 
    about.home="http://github.com/blackrim/phyutility" \ 
    software.version="2.7.3dfsg-2-deb" \ 
    upstream.version="2.7.3" \ 
    version="1" \ 
    about.copyright=" 2007-2014 Stephen Smith <blackrim@gmail.com>" \ 
    about.license="GPL-3.0+" \ 
    about.license_file="/usr/share/doc/phyutility/copyright" \ 
    extra.binaries="/usr/bin/phyutility" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y phyutility || apt-get install -y phyutility) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
