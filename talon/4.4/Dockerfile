################## BASE IMAGE ######################
FROM python:3.7-slim

################## METADATA ######################
LABEL base_image="python:3.7-slim"
LABEL version="3"
LABEL software="talon"
LABEL software.version="4.4"
LABEL about.summary="TALON is a Python program for identifying known and novel genes/isoforms in long read transcriptome data sets."
LABEL about.home="https://github.com/dewyman/TALON"
LABEL about.documentation="https://github.com/dewyman/TALON/blob/master/README.md"
LABEL about.license_file="https://github.com/dewyman/TALON/blob/master/LICENSE"
LABEL about.license="MIT"
LABEL about.tags="Transcriptomics"

################## MAINTAINER ######################
MAINTAINER SASC <sasc@lumc.nl>

################## INSTALLATION ######################
RUN apt-get clean all && \
    apt-get update && \
    apt-get install -y build-essential && \
    apt-get install -y zlib1g-dev && \
    apt-get install -y libbz2-dev && \
    apt-get install -y liblzma-dev && \
    apt-get install -y git && \
    apt-get install -y bedtools && \
    pip install pybedtools==0.8.0 && \
    pip install pandas==0.25.3 && \
    pip install numpy==1.17.3 && \
    pip install https://github.com/dewyman/TALON/archive/4.4.tar.gz && \
    apt-get update && \
    apt-get clean all && \
    apt-get purge && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

################## TOOL INFO ##################
# talon_generate_report not working due to R dependencies.
