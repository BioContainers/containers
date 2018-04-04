FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="phybin" \ 
    container="phybin" \ 
    about.summary="binning/clustering newick trees by topology" \ 
    about.home="http://www.cs.indiana.edu/~rrnewton/projects/phybin/" \ 
    software.version="0.3-1b1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/phybin/copyright" \ 
    extra.binaries="/usr/bin/phybin" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y phybin && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
