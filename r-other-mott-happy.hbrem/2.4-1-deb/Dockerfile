FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="r-other-mott-happy.hbrem" \ 
    container="r-other-mott-happy.hbrem" \ 
    about.summary="GNU R package for fine-mapping complex diseases" \ 
    about.home="http://www.well.ox.ac.uk/happy/happyR.shtml" \ 
    software.version="2.4-1-deb" \ 
    version="1" \ 
    about.copyright=" Richard Mott <Richard.Mott@well.ox.ac.uk>" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/r-other-mott-happy.hbrem/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y r-other-mott-happy.hbrem && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
