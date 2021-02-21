# Base image
FROM biocontainers/biocontainers:v1.2.0_cv1 

################## METADATA ######################

LABEL base_image="biocontainers:v1.2.0_cv1"
LABEL version="1"
LABEL software="nanosv"
LABEL software.version="1.2.4"
LABEL about.summary="NanoSV is a software package that can be used to identify structural genomic variations in long-read sequencing data"
LABEL about.home="https://github.com/mroosmalen/nanosv"
LABEL about.documentation="https://github.com/mroosmalen/nanosv"
LABEL about.license_file="https://github.com/mroosmalen/nanosv/blob/master/LICENSE"
LABEL about.license="MIT"
LABEL about.tags="Nanopore,PacBio,Structural Variants"

################## MAINTAINER ##################
MAINTAINER Kieran O'Neill <koneill@bcgsc.ca>


################## INSTALLATION ##################
USER root

SHELL ["/bin/bash", "-c"]

RUN apt-get update && \
	conda update --all && \
    conda install -y -c anaconda python=3.6 && \
	conda install -y -c bioconda sambamba && \
	conda install -y -c bioconda nanosv=1.2.4 && \
	conda update --all && \
    apt-get update && \
    apt-get clean && \
    apt-get purge && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

USER biodocker
