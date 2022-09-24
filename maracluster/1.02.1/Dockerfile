################## BASE IMAGE ######################
FROM ubuntu:18.04

################## METADATA ######################
LABEL base_image="ubuntu:18.04"
LABEL version="1"
LABEL software="maracluster"
LABEL software.version="1.02.1"
LABEL about.summary="MaRaCluster - a tool for clustering and merging of fragment spectra from shotgun proteomics experiments."
LABEL about.home="https://github.com/statisticalbiotechnology/maracluster"
LABEL about.documentation="https://github.com/statisticalbiotechnology/maracluster"
LABEL about.license_file="https://github.com/statisticalbiotechnology/maracluster/blob/master/LICENSE"
LABEL about.license="SPDX:Apache-2.0"
LABEL about.tags="Proteomics"

################## MAINTAINER ######################
MAINTAINER Yasset Perez-Riverol <ypriverol@gmail.com>

################## INSTALLATION ######################

ENV DEBIAN_FRONTEND noninteractive

## Update and install packages
RUN apt-get update -y && apt-get install -y libgomp1 wget

## Temp directory
RUN mkdir /opt/software

## Download everything
RUN cd /opt/software && wget https://github.com/statisticalbiotechnology/maracluster/releases/download/rel-1-02-1/ubuntu.tar.gz && tar xvzf ubuntu.tar.gz && apt-get install -y ./maracluster-v1-02-linux-amd64.deb && rm -f maracluster-v1-02-linux-amd64.deb

WORKDIR /data/
