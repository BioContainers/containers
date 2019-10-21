FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="snap-aligner" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="snap-aligner" \ 
    about.summary="Scalable Nucleotide Alignment Program" \ 
    about.home="http://snap.cs.berkeley.edu/" \ 
    software.version="1.0beta.18dfsg-3-deb" \ 
    version="1" \ 
    about.copyright="2012, Regents of the University of California." \ 
    about.license="Apache-2.0" \ 
    about.license_file="/usr/share/doc/snap-aligner/copyright" \ 
    extra.binaries="/usr/bin/SNAPCommand,/usr/bin/snap-aligner" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y snap-aligner || apt-get install -y snap-aligner) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
