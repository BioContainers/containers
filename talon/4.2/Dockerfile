################## BASE IMAGE ######################
FROM biocontainers/biocontainers:v1.0.0_cv5

################## METADATA ######################
LABEL base_image="biocontainers:v1.0.0_cv5"
LABEL version="2"
LABEL software="talon"
LABEL software.version="4.2"
LABEL about.summary="TALON is a Python program for identifying known and novel genes/isoforms in long read transcriptome data sets."
LABEL about.home="https://github.com/dewyman/TALON"
LABEL about.documentation="https://github.com/dewyman/TALON/blob/master/README.md"
LABEL about.license_file="https://github.com/dewyman/TALON/blob/master/LICENSE"
LABEL about.license="MIT"
LABEL about.tags="Transcriptomics"

################## MAINTAINER ######################
MAINTAINER SASC <sasc@lumc.nl>

################## INSTALLATION ######################
USER root

SHELL ["/bin/bash", "-c"]

RUN apt-get update && \
    apt-get install -y python3 && \
    apt-get install -y python3-pip && \
    pip install pathlib==1.0.1 && \
    pip3 install pathlib2==2.3.4 && \
    pip3 install pandas==0.25.1 && \
################## INSTALL TALON ##################
    ZIP=v4.2 && \
    wget https://github.com/dewyman/TALON/archive/${ZIP}.zip -O /tmp/${ZIP}.zip && \
    unzip /tmp/${ZIP}.zip -d /home/biodocker/bin/ && \
    chmod -R 755 /home/biodocker/bin/TALON-${ZIP:1}/* && \
    rm /tmp/${ZIP}.zip && \
    rm -rf /home/biodocker/bin/TALON-${ZIP:1}/testing_suite && \
    rm -rf /home/biodocker/bin/TALON-${ZIP:1}/archived && \
    rm -rf /home/biodocker/bin/TALON-${ZIP:1}/timing_tests && \
    rm -rf /home/biodocker/bin/TALON-${ZIP:1}/example && \
    rm /home/biodocker/bin/TALON-${ZIP:1}/diagram.png && \
################## WORKAROUND WHILE REPO FILES DO NOT INCLUDE SHEBANG ##################
    sed -i '1i#!/usr/bin/env python3' /home/biodocker/bin/TALON-${ZIP:1}/talon.py && \
    sed -i '1i#!/usr/bin/env python3' /home/biodocker/bin/TALON-${ZIP:1}/initialize_talon_database.py && \
    sed -i '1i#!/usr/bin/env python3' /home/biodocker/bin/TALON-${ZIP:1}/post-TALON_tools/create_abundance_file_from_database.py && \
    sed -i '1i#!/usr/bin/env python3' /home/biodocker/bin/TALON-${ZIP:1}/post-TALON_tools/create_GTF_from_database.py && \
    sed -i '1i#!/usr/bin/env python3' /home/biodocker/bin/TALON-${ZIP:1}/post-TALON_tools/map_antisense_genes_to_sense.py && \
    sed -i '1i#!/usr/bin/env python3' /home/biodocker/bin/TALON-${ZIP:1}/post-TALON_tools/summarize_datasets.py && \
    sed -i '1i#!/usr/bin/env python3' /home/biodocker/bin/TALON-${ZIP:1}/post-TALON_tools/create_GTF_abundance_from_database.py && \
    sed -i '1i#!/usr/bin/env python3' /home/biodocker/bin/TALON-${ZIP:1}/reformat_gtf.py && \
################## MAKE THE TOOL SCRIPTS AVAILABLE THROUGHOUT THE CONTAINER ##################
    ln -s /home/biodocker/bin/TALON-${ZIP:1}/talon.py /usr/bin/talon && \
    ln -s /home/biodocker/bin/TALON-${ZIP:1}/initialize_talon_database.py /usr/bin/initialize_talon_database && \
    ln -s /home/biodocker/bin/TALON-${ZIP:1}/post-TALON_tools/create_abundance_file_from_database.py /usr/bin/create_abundance_file_from_database && \
    ln -s /home/biodocker/bin/TALON-${ZIP:1}/post-TALON_tools/create_GTF_from_database.py /usr/bin/create_GTF_from_database && \
    ln -s /home/biodocker/bin/TALON-${ZIP:1}/post-TALON_tools/map_antisense_genes_to_sense.py /usr/bin/map_antisense_genes_to_sense && \
    mv /home/biodocker/bin/TALON-${ZIP:1}/post-TALON_tools/summarize_datasets.py /home/biodocker/bin/TALON-${ZIP:1}/ && \
    ln -s /home/biodocker/bin/TALON-${ZIP:1}/summarize_datasets.py /usr/bin/summarize_datasets && \
    ln -s /home/biodocker/bin/TALON-${ZIP:1}/post-TALON_tools/create_GTF_abundance_from_database.py /usr/bin/create_GTF_abundance_from_database && \
    ln -s /home/biodocker/bin/TALON-${ZIP:1}/reformat_gtf.py /usr/bin/reformat_gtf && \
################## - ##################
    apt-get update && \
    apt-get clean && \
    apt-get purge && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

USER biodocker

WORKDIR /data/

################## TOOL INFO ##################
# talon.py --> talon
# initialize_talon_database.py --> initialize_talon_database
# create_abundance_file_from_database.py --> create_abundance_file_from_database
# create_GTF_from_database.py --> create_GTF_from_database
# map_antisense_genes_to_sense.py --> map_antisense_genes_to_sense
# summarize_datasets.py --> summarize_datasets
# create_GTF_abundance_from_database.py --> create_GTF_abundance_from_database
# reformat_gtf.py --> reformat_gtf
