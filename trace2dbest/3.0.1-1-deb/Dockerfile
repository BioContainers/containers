FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="trace2dbest" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="trace2dbest" \ 
    about.summary="bulk submission of chromatogram data to dbEST" \ 
    about.home="http://www.nematodes.org/bioinformatics/trace2dbEST/" \ 
    software.version="3.0.1-1-deb" \ 
    upstream.version="3.0.1" \ 
    version="1" \ 
    about.copyright="2005 Alasdair Anthony, Ralf Schmid <nematode.bioinf@ed.ac.uk>" \ 
    about.license="GPL-2.0" \ 
    about.license_file="/usr/share/doc/trace2dbest/copyright" \ 
    extra.binaries="/usr/bin/rename_file.pl,/usr/bin/trace2dbest.pl" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y trace2dbest || apt-get install -y trace2dbest) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
