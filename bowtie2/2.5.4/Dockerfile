FROM debian:bookworm-slim

MAINTAINER Sebastian Bassi <sebastian@toyoko.io>
LABEL    software="bowtie2"

ARG software_version=2.5.4

RUN apt-get update
RUN apt-get install -y wget && rm -rf /var/lib/apt/lists/*

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
RUN conda install ncurses bowtie2=$software_version

CMD ["/bin/sh"]

