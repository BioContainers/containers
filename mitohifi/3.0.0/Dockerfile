# Base Image
FROM ubuntu:18.04

# Metadata
LABEL base_image="ubuntu:18.04"
LABEL version="1"
LABEL software="MitoHiFi"
LABEL software.version="3.0.0"
LABEL about.summary="a python workflow that assembles a species mitogenome from Pacbio HiFi reads."
LABEL about.home="https://github.com/marcelauliano/MitoHiFi"
LABEL about.documentation="https://github.com/marcelauliano/MitoHiFi"
LABEL about.license="MIT"
LABEL about.license_file="https://github.com/marcelauliano/MitoHiFi/blob/master/LICENSE"
LABEL about.tags="mitogenome, MT, organelle"
LABEL extra.identifiers.biotools="MitoHiFi"

# Maintainer
MAINTAINER Ksenia Krasheninnikova kk16@sanger.ac.uk


ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get -qq -y update \
    && apt-get -qq -y update \
    && apt-get -qq -y install vim \
    default-jre \
    ncbi-blast+ \ 
    automake \
    autoconf \
    default-jre \ 
    build-essential \
    cd-hit \
    mafft \      
    samtools \           
    curl \
    wget \
    bedtools \
    infernal \
    python3-pip \
    python3-dev \
    git \
    libz-dev \
    libopenjp2-7 \
    libtiff5 \
    && apt-get -y clean \
    && rm -rf /var/lib/apt/lists/* /var/tmp/*

WORKDIR /opt

# /opt/minimap2-2.24_x64-linux
RUN curl -L https://github.com/lh3/minimap2/releases/download/v2.24/minimap2-2.24_x64-linux.tar.bz2 \
    | tar -jxvf -

# /opt/MitoFinder
RUN git clone https://github.com/RemiAllio/MitoFinder.git \
    && cd MitoFinder \
    && ./install.sh

# /opt/MitoHiFi
RUN git clone https://github.com/marcelauliano/MitoHiFi.git \
    && cd MitoHiFi \
    && chmod +x *.py \
    && sed -i '1i#!/usr/bin/env python3' mitohifi.py findFrameShifts.py fixContigHeaders.py \
    && sed -i '1 s/python\>/python3/' *.py \
    && pip3 --no-cache-dir install --upgrade pip \
    && pip3 --no-cache-dir install biopython \
    pandas \
    Pillow \
    matplotlib \
    entrezpy \
    dna_features_viewer \
    bcbio-gff

# /opt/hifiasm-0.16.1
RUN curl -L https://github.com/chhylp123/hifiasm/archive/refs/tags/0.16.1.tar.gz \
    | tar -xzvf - \
    && cd hifiasm-0.16.1 \
    && make \
    && wget -P /usr/local/src https://bootstrap.pypa.io/pip/2.7/get-pip.py \
    && python2 /usr/local/src/get-pip.py \
    && python2 -m pip --no-cache-dir install biopython==1.70

# /opt/conda
RUN wget -P /usr/local/src https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
    && bash /usr/local/src/Miniconda3-latest-Linux-x86_64.sh -b -p /opt/conda \
    && /opt/conda/bin/conda install -n base conda-libmamba-solver

# /opt/conda/envs/mitos_env
RUN /opt/conda/bin/conda create -n mitos_env --experimental-solver=libmamba -c bioconda -y mitos \
    && mkdir /opt/conda/envs/mitos_env/bin/clean \
    && ln -s ../runmitos.py /opt/conda/envs/mitos_env/bin/clean/runmitos.py \
    && sed -i "/runmitos\.py/s#python2\", \"#/opt/conda/envs/mitos_env//bin#" /opt/MitoHiFi/parallel_annotation_mitos.py

RUN useradd -m mu
RUN chown -R mu:mu /opt/MitoFinder/
USER mu

WORKDIR /tmp

ENV PATH /opt/minimap2-2.24_x64-linux/:${PATH}
ENV PATH /opt/MitoFinder/:${PATH}
ENV PATH /opt/MitoHiFi/:${PATH}
ENV PATH /opt/hifiasm-0.16.1/:${PATH}
ENV PATH /opt/conda/envs/mitos_env/bin/clean/:${PATH}

