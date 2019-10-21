FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="probabel" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="probabel" \ 
    about.summary="Toolset for Genome-Wide Association Analysis" \ 
    about.home="http://www.genabel.org" \ 
    software.version="0.5.0dfsg-3-deb" \ 
    upstream.version="0.5.0" \ 
    version="1" \ 
    about.copyright=" 2009-2013 The GenABEL team" \ 
    about.license="GPL-2.0+" \ 
    about.license_file="/usr/share/doc/probabel/copyright" \ 
    extra.binaries="/usr/bin/pacoxph,/usr/bin/palinear,/usr/bin/palogist,/usr/bin/probabel,/usr/bin/probabel.pl" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y probabel || apt-get install -y probabel) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
