FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="probabel" \ 
    container="probabel" \ 
    about.summary="Toolset for Genome-Wide Association Analysis" \ 
    about.home="http://www.genabel.org" \ 
    software.version="0.4.5-3b1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/probabel/copyright" \ 
    extra.binaries="/usr/bin/pacoxph,/usr/bin/palinear,/usr/bin/palogist,/usr/bin/probabel,/usr/bin/probabel.pl" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y probabel && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
