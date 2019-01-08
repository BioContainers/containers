# Base Image
FROM biocontainers/biocontainers:v1.0.0_cv4

# Metadata
LABEL base_image="biocontainers:v1.0.0_cv4"
LABEL software="famli"
LABEL software.version="1.0"
LABEL version="2"
LABEL about.summary="Functional Analysis of Metagenomes by Likelihood Inference"
LABEL about.home="https://github.com/FredHutch/FAMLI"
LABEL about.license="MIT"
LABEL about.license_file="https://github.com/FredHutch/FAMLI/blob/master/LICENSE.txt"
LABEL about.tags="Metagenomics"

MAINTAINER Samuel Minot, Ph.D. sminot@fredhutch.org

USER root

# Install BATS
RUN apt update && \
    apt install -y bats

# Set the default langage to C
ENV LC_ALL C

# Use /share as the working directory
RUN mkdir /share
WORKDIR /share

# Install DIAMOND v0.9.10
RUN cd /usr/local/bin && \
    wget -q https://github.com/bbuchfink/diamond/releases/download/v0.9.10/diamond-linux64.tar.gz && \
    tar xzf diamond-linux64.tar.gz && \
    rm diamond-linux64.tar.gz

# Install the SRA toolkit
RUN cd /usr/local/bin && \
    wget -q https://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/2.8.2/sratoolkit.2.8.2-ubuntu64.tar.gz && \
    tar xzf sratoolkit.2.8.2-ubuntu64.tar.gz && \
    ln -s /usr/local/bin/sratoolkit.2.8.2-ubuntu64/bin/* /usr/local/bin/ && \
    rm sratoolkit.2.8.2-ubuntu64.tar.gz

# Install the FASTX Toolkit
RUN cd /usr/local/bin && \
    wget -q http://hannonlab.cshl.edu/fastx_toolkit/fastx_toolkit_0.0.13_binaries_Linux_2.6_amd64.tar.bz2 && \
    tar xf fastx_toolkit_0.0.13_binaries_Linux_2.6_amd64.tar.bz2 && \
    rm fastx_toolkit_0.0.13_binaries_Linux_2.6_amd64.tar.bz2 && \
    mv bin/* ./

# Install FAMLI
RUN pip install famli==1.0

# Run tests
RUN mkdir /share/tests
ADD tests.bats /share/tests/
RUN bats /share/tests/ && rm -r /share/tests

