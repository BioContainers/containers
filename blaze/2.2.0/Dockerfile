FROM python:3.10.1

################## METADATA ######################

LABEL base_image="python:3.10.1"
LABEL version="1"
LABEL software="BLAZE"
LABEL software.version="2.2.0"
LABEL about.summary="Barcode identification from Long reads for AnalyZing single cell gene Expression."
LABEL about.home="https://github.com/shimlab/BLAZE/"
LABEL about.license="GPL-3.0-only"
LABEL about.license_file="https://github.com/shimlab/BLAZE/blob/main/LICENSE"
LABEL extra.identifiers.biotools="blaze"

################## MAINTAINER ######################
MAINTAINER "Austyn Trull <atrull@uab.edu>"

################## INSTALLATION ######################

RUN apt-get update && apt-get install --no-install-recommends -y \
        build-essential \
        libhdf5-dev && \
    apt-get clean && \
    apt-get purge && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir blaze2==2.2.0
