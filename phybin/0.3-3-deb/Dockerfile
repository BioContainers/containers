FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="phybin" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="phybin" \ 
    about.summary="binning/clustering newick trees by topology" \ 
    about.home="http://www.cs.indiana.edu/~rrnewton/projects/phybin/" \ 
    software.version="0.3-3-deb" \ 
    upstream.version="0.3" \ 
    version="1" \ 
    about.copyright="2010-2015 Ryan Newton <rrnewton@gmail.com>" \ 
    about.license="BSD-3-clause" \ 
    about.license_file="/usr/share/doc/phybin/copyright" \ 
    extra.binaries="/usr/bin/phybin" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y phybin || apt-get install -y phybin) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
