FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="ghmm" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="ghmm" \ 
    about.summary="General Hidden-Markov-Model library - tools" \ 
    about.home="https://ghmm.org" \ 
    software.version="0.9rc3-2-deb" \ 
    version="1" \ 
    about.copyright="" \ 
    about.license="GPL-2.0+" \ 
    about.license_file="/usr/share/doc/ghmm/copyright" \ 
    extra.binaries="/usr/bin/HMMEd,/usr/bin/ghmm-cluster,/usr/bin/ghmm-config,/usr/bin/probdist,/usr/bin/scluster,/usr/bin/smix_hmm" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y ghmm || apt-get install -y ghmm) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
