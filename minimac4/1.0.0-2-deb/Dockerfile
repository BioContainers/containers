FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="minimac4" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="minimac4" \ 
    about.summary="Fast Imputation Based on State Space Reduction HMM" \ 
    about.home="https://genome.sph.umich.edu/wiki/Minimac4" \ 
    software.version="1.0.0-2-deb" \ 
    upstream.version="1.0.0" \ 
    version="1" \ 
    about.copyright="2016-2018 Sayantan Das, Christian Fuchsberger <cfuchsb at umich.edu>, David Hinds, Mary Kate Wing <mktrost at umich.edu> and Goncalo Abecasis <goncalo at umich.edu>" \ 
    about.license="GPL-3" \ 
    about.license_file="/usr/share/doc/minimac4/copyright" \ 
    extra.binaries="/usr/bin/minimac4" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y minimac4 || apt-get install -y minimac4) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
