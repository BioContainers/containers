FROM debian:wheezy

#####BIOCONTAINERS LABELS#####
LABEL version="1" \ 
	software="mindthegap" \ 
	software.version="2.0.1" \ 
    about.summary="MindTheGap performs detection and assembly of DNA insertion variants in NGS read datasets with respect to a reference genome." \ 
	about.home="https://gatb.inria.fr/software/mind-the-gap/" \ 
    about.documentation="https://github.com/GATB/MindTheGap" \ 
    about.license="SPDX:AGPL-3.0-only" \ 
    about.license_file="http://www.gnu.org/licenses/agpl-3.0.en.html" \ 
    extra.identifier.biotools="mindthegap" \ 
    base_image="debian:wheezy"

MAINTAINER Claire Lemaitre claire.lemaitre@inria.fr

# Set MindTheGap version
ENV MTG_VERSION 2.0.1

# Set noninteratve mode
ENV DEBIAN_FRONTEND noninteractive
ENV PACKAGES wget gcc g++ make cmake zlib1g-dev libboost-dev git

ENV DIR /opt
ENV SOURCE MindTheGap
ENV BUILD build

WORKDIR ${DIR}

RUN apt-get update -y && \
    apt-get install -y --no-install-recommends ${PACKAGES}

RUN git config --global http.sslVerify false

# clone the github repo
RUN git clone --recursive https://github.com/GATB/MindTheGap.git

WORKDIR ${DIR}/${SOURCE}
RUN git submodule init

# Using an official release
RUN git checkout v${MTG_VERSION}
RUN git submodule update

RUN mkdir ${BUILD}
WORKDIR ${DIR}/${SOURCE}/${BUILD}

RUN cmake ..
RUN make

# symlink binary in /usr/local/bin
RUN ln -s ${DIR}/${SOURCE}/${BUILD}/bin/MindTheGap /usr/local/bin


