FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="runcircos-gui" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="runcircos-gui" \ 
    about.summary="GUI tool to run circos" \ 
    about.home="https://github.com/narunlifescience/runcircos-gui" \ 
    software.version="0.0git20180828.97703b9-1-deb" \ 
    upstream.version="0.0" \ 
    version="1" \ 
    about.copyright="2014-2016 Arun Narayanankutty <n.arun.lifescience@gmail.com>" \ 
    about.license="GPL-2" \ 
    about.license_file="/usr/share/doc/runcircos-gui/copyright" \ 
    extra.binaries="/usr/bin/runcircos-gui" \ 
    about.tags="uitoolkit::qt" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y runcircos-gui || apt-get install -y runcircos-gui) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
