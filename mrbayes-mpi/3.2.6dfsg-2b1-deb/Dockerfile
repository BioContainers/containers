FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="mrbayes-mpi" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="mrbayes-mpi" \ 
    about.summary="Bayesian Inference of Phylogeny - mpi version" \ 
    about.home="http://mrbayes.csit.fsu.edu/" \ 
    software.version="3.2.6dfsg-2b1-deb" \ 
    upstream.version="3.2.6" \ 
    version="1" \ 
    about.license="custom, see /usr/share/doc/mrbayes-mpi/copyright" \ 
    about.license_file="/usr/share/doc/mrbayes-mpi/copyright" \ 
    extra.binaries="/usr/bin/mb-mpi" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y mrbayes-mpi || apt-get install -y mrbayes-mpi) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
