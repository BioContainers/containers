# Base image
FROM ubuntu:bionic

# Metadata
LABEL base_image="ubuntu:bionic"
LABEL version="1"
LABEL software="gwas-fasp"
LABEL software.version="v1.0.0"
LABEL about.summary="Container image for GWAS analysis workflow for GA4GH Plenary 2020 FASP demonstrator containging PLINK and custom scripts"
LABEL about.home="https://www.cog-genomics.org/plink2"
LABEL about.license="SPDX:GPL-3.0-or-later"
LABEL about.license_file="https://spdx.org/licenses/GPL-3.0-or-later.html"

# Maintainer
MAINTAINER Alexander Kanitz <alexander.kanitz@unibas.ch>

RUN apt-get -qq update && \
	apt-get -qq install \
	wget \
	unzip \
	gawk \
	python3-dev \
	python3-pip

RUN mkdir /opt/plink
RUN wget http://s3.amazonaws.com/plink1-assets/dev/plink_linux_x86_64.zip && \
        unzip -d /opt/plink plink_linux_x86_64.zip && \
        rm plink_linux_x86_64.zip

RUN ln -s /opt/plink/plink /usr/local/bin/

COPY ./requirements.txt /opt/requirements.txt

RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install -r /opt/requirements.txt

COPY ./scripts/* /usr/local/bin/
