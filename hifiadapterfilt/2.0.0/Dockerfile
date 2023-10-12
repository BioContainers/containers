################## BASE IMAGE ######################
FROM ubuntu:20.04

################## METADATA ######################
LABEL base_image="ubuntu:20.04"
LABEL version="2"
LABEL software="HiFiAdapterFilt"
LABEL software.version="v2.0.0"
LABEL about.summary="Remove CCS reads with remnant PacBio adapter sequences and convert outputs to a compressed .fastq (.fastq.gz)."
LABEL about.home="https://github.com/sheinasim/HiFiAdapterFilt"
LABEL about.documentation="https://github.com/sheinasim/HiFiAdapterFilt"
LABEL about.license_file="https://github.com/sheinasim/HiFiAdapterFilt/LICENSE"
LABEL about.license="GNU General Public License v3.0"
LABEL extra.identifiers.biotools="hifiadapterfilt"
LABEL about.tags="genomics, hifi"

################## MAINTAINER ######################
MAINTAINER Arthur Le Bars <arthur.le-bars@france-bioinformatique.fr>

################## INSTALLATION ######################
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -qq -y update

RUN apt-get -qq -y update

RUN apt-get -qq -y install vim \
    ncbi-blast+ \  
    bamtools \        
    pigz \
    wget
    
RUN apt-get -y clean

RUN wget -qO- https://github.com/sheinasim/HiFiAdapterFilt/archive/refs/tags/v2.0.0.tar.gz | tar xvz -C /opt

WORKDIR /opt

ENV PATH $PATH:/opt/HiFiAdapterFilt

ENV PATH $PATH:/opt/HiFiAdapterFilt/DB

WORKDIR /tmp
