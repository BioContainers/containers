################## BASE IMAGE ######################
FROM ubuntu:20.04

################## METADATA ######################
LABEL base_image="ubuntu:20.04"
LABEL version="2"
LABEL software="HiFiAdapterFilt"
LABEL software.version="2.0.0"
LABEL about.summary="Remove CCS reads with remnant PacBio adapter sequences and convert outputs to a compressed .fastq (.fastq.gz)."
LABEL about.home="https://github.com/sheinasim/HiFiAdapterFilt"
LABEL about.documentation="https://github.com/sheinasim/HiFiAdapterFilt"
LABEL about.license_file="https://github.com/sheinasim/HiFiAdapterFilt/blob/master/LICENSE"
LABEL about.license="GPL-3.0"
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

ENV HIFIADPATERFILT_VERSION "2.0.0"

ENV PATH $PATH:/opt/HiFiAdapterFilt-${HIFIADPATERFILT_VERSION}

ENV PATH $PATH:/opt/HiFiAdapterFilt-${HIFIADPATERFILT_VERSION}/DB

WORKDIR /tmp

CMD ["bash"]