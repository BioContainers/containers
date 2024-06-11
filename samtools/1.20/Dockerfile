################## BASE IMAGE ######################
FROM debian:bookworm

################## METADATA ######################
ARG software_version=1.20
LABEL software="samtools"
LABEL software.version="$software_version"
LABEL about.summary="Tools for manipulating next-generation sequencing data"
LABEL about.home="https://github.com/samtools/samtools"
LABEL about.documentation="https://github.com/samtools/samtools"
LABEL about.license_file="https://github.com/samtools/samtools"
LABEL about.license_file="https://github.com/samtools/samtools/blob/develop/LICENSE"
LABEL about.license="SPDX:MIT"
LABEL about.tags="Genomics"
LABEL extra.identifiers.biotools="SAM"
LABEL extra.binaries="samtools"

################## MAINTAINER ######################
MAINTAINER Sebastian Bassi <sebastian@toyoko.io>

ENV PATH="/root/miniconda3/bin:${PATH}"
ARG PATH="/root/miniconda3/bin:${PATH}"
RUN apt-get update
RUN apt-get install -y wget && rm -rf /var/lib/apt/lists/*
RUN wget \
    https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
    && mkdir /root/.conda \
    && bash Miniconda3-latest-Linux-x86_64.sh -b \
    && rm -f Miniconda3-latest-Linux-x86_64.sh
RUN conda config --add channels bioconda
RUN conda install conda-forge::libgcc-ng
RUN conda install ncurses samtools=$software_version
WORKDIR /data/
