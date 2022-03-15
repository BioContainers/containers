################## BASE IMAGE ######################
FROM ubuntu:latest

################## METADATA ######################
LABEL base_image="ubuntu:latest"
LABEL version="1"
LABEL software="diann"
LABEL software.version="1.8.0"
LABEL about.summary="DIA-NN - a universal software for data-independent acquisition (DIA) proteomics data processing."
LABEL about.home="https://github.com/vdemichev/DiaNN"
LABEL about.documentation="https://github.com/vdemichev/DiaNN"
LABEL about.license_file="https://github.com/vdemichev/DiaNN/LICENSE.txt"
LABEL about.license="SPDX:CC-BY-NC-4.0"
LABEL about.tags="Proteomics"

################## MAINTAINER ######################
MAINTAINER Yasset Perez-Riverol <ypriverol@gmail.com>

################## INSTALLATION ######################

ENV DEBIAN_FRONTEND noninteractive

## Update and install packages
RUN apt-get update -y && apt-get install -y g++ build-essential cmake zlib1g-dev libbz2-dev libboost-all-dev wget

## Temp directory
RUN mkdir /opt/software

## Download everything
RUN cd /opt/software && wget https://github.com/vdemichev/DiaNN/releases/download/1.8/diann_1.8.deb && apt-get install -y ./diann_1.8.deb && rm -f diann_1.8.deb

RUN mv /usr/diann/1.8/diann-1.8 /usr/diann/1.8/diann

ENV PATH="$PATH:/usr/diann/1.8"

WORKDIR /data/
