################## BASE IMAGE ##################
FROM biocontainers/biocontainers:v1.0.0_cv5

################## METADATA ##################
LABEL base_image="biocontainers:v1.0.0_cv5"
LABEL version="1"
LABEL software="transcriptclean"
LABEL software.version="1.0.7"
LABEL about.summary="TranscriptClean is a Python program that corrects mismatches, microindels, and noncanonical splice junctions in long reads that have been mapped to the genome."
LABEL about.home="https://github.com/dewyman/TranscriptClean"
LABEL about.documentation="https://github.com/dewyman/TranscriptClean/blob/master/README.md"
LABEL about.license_file="https://github.com/dewyman/TranscriptClean/blob/master/LICENSE.md"
LABEL about.license="MIT"
LABEL about.tags="Transcriptomics"

################## MAINTAINER ##################
MAINTAINER SASC <sasc@lumc.nl>

################## INSTALLATION ##################
USER root

SHELL ["/bin/bash", "-c"]

RUN apt-get update && \
    apt-get install -y bc && \
    apt-get install -y libbz2-dev && \
    apt-get install -y liblzma-dev && \
    pip install pybedtools==0.8.0 && \
    pip install pyfasta==0.5.2 && \
    pip install numpy==1.16.04 && \
    conda install -y bedtools=2.28.0 && \
################## INSTALL TRANSCRIPTCLEAN ##################
    ZIP=v1.0.7 && \
    wget https://github.com/dewyman/TranscriptClean/archive/${ZIP}.zip -O /tmp/${ZIP}.zip && \
    unzip /tmp/${ZIP}.zip -d /home/biodocker/bin/ && \
    chmod -R 755 /home/biodocker/bin/TranscriptClean-${ZIP:1}/* && \
    rm /tmp/${ZIP}.zip && \
    rm -rf /home/biodocker/bin/TranscriptClean-${ZIP:1}/example_files && \
    rm -rf /home/biodocker/bin/TranscriptClean-${ZIP:1}/test_TranscriptClean && \
################## WORKAROUND WHILE REPO FILES DO NOT INCLUDE SHEBANG ##################
    sed -i '1i#!/usr/bin/env python' /home/biodocker/bin/TranscriptClean-${ZIP:1}/TranscriptClean.py && \
    sed -i '1i#!/usr/bin/env python' /home/biodocker/bin/TranscriptClean-${ZIP:1}/clean_splice_jns.py && \
    sed -i '1i#!/usr/bin/env python' /home/biodocker/bin/TranscriptClean-${ZIP:1}/accessory_scripts/get_SJs_from_gtf.py && \
    sed -i '1i#!/usr/bin/env python' /home/biodocker/bin/TranscriptClean-${ZIP:1}/accessory_scripts/get_corrected_SJs_from_log.py && \
    sed -i '1i#!/usr/bin/env bash' /home/biodocker/bin/TranscriptClean-${ZIP:1}/accessory_scripts/get_TranscriptClean_stats.sh && \
################## MAKE THE TOOL SCRIPTS AVAILABLE THROUGHOUT THE CONTAINER ##################
    ln -s /home/biodocker/bin/TranscriptClean-${ZIP:1}/TranscriptClean.py /usr/bin/TranscriptClean && \
    ln -s /home/biodocker/bin/TranscriptClean-${ZIP:1}/clean_splice_jns.py /usr/bin/clean_splice_jns && \
    ln -s /home/biodocker/bin/TranscriptClean-${ZIP:1}/accessory_scripts/get_SJs_from_gtf.py /usr/bin/get_SJs_from_gtf && \
    ln -s /home/biodocker/bin/TranscriptClean-${ZIP:1}/accessory_scripts/get_corrected_SJs_from_log.py /usr/bin/get_corrected_SJs_from_log && \
    ln -s /home/biodocker/bin/TranscriptClean-${ZIP:1}/accessory_scripts/get_TranscriptClean_stats.sh /usr/bin/get_TranscriptClean_stats && \
################## - ##################
    apt-get update && \
    apt-get clean && \
    apt-get purge && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

USER biodocker

WORKDIR /data/

################## TOOL INFO ##################
# TranscriptClean.py --> TranscriptClean
# clean_splice_jns.py --> clean_splice_jns
# get_SJs_from_gtf.py --> get_SJs_from_gtf
# get_corrected_SJs_from_log.py --> get_corrected_SJs_from_log
# get_TranscriptClean_stats.sh --> get_TranscriptClean_stats
