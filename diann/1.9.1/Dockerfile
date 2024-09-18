################## BASE IMAGE ######################
FROM ubuntu:latest

################## METADATA ######################
LABEL base_image="ubuntu:latest"
LABEL version="1"
LABEL software="diann"
LABEL software.version="1.9.1"
LABEL about.summary="DIA-NN - a universal software for data-independent acquisition (DIA) proteomics data processing."
LABEL about.home="https://github.com/vdemichev/DiaNN"
LABEL about.documentation="https://github.com/vdemichev/DiaNN"
LABEL about.license_file="https://github.com/vdemichev/DiaNN/LICENSE.txt"
LABEL about.license="custom, see /usr/diann/1.9.1/LICENSE.txt"
LABEL about.tags="Proteomics"

################## MAINTAINER ######################
MAINTAINER Niko Pinter <niko.pinter@uniklinik-freiburg.de>

################## INSTALLATION ######################

ENV DEBIAN_FRONTEND noninteractive

## Update and install packages
RUN apt-get update -y && apt-get install -y \
    wget locales unzip \
 && sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen \
 && locale-gen

## Set working directory
WORKDIR /opt/software

## Download diann-1.9.1.Linux.zip and unzip
RUN wget https://github.com/vdemichev/DiaNN/releases/download/1.9.1/diann-1.9.1.Linux.zip && \
    unzip diann-1.9.1.Linux.zip && \
    rm diann-1.9.1.Linux.zip

RUN mkdir -p /usr/diann/1.9.1 && \
    mv /opt/software/diann-1.9.1/* /usr/diann/1.9.1 && \
    mv /usr/diann/1.9.1/diann-linux /usr/diann/1.9.1/diann

RUN chmod +x /usr/diann/1.9.1/diann

## Set environment variables
ENV PATH="/usr/diann/1.9.1:$PATH"
ENV LD_LIBRARY_PATH="/usr/diann/1.9.1:$LD_LIBRARY_PATH"

## Create symbolic links for libgomp-98b21ff3.so.1
RUN ln -s /usr/diann/1.9.1/libgomp-98b21ff3.so.1 /usr/diann/1.9.1/libgomp.so.1

WORKDIR /data/
