FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get -qq -y update \
    && apt-get -qq -y update \
    && apt-get -qq -y install \
    autoconf \
    automake \
    bedtools \
    build-essential \
    curl \
    default-jre \ 
    git \
    infernal \
    libopenjp2-7 \
    libtiff5 \
    libz-dev \
    mafft \
    ncbi-blast+ \
    python3-dev \
    python3-pip \
    samtools \
    wget \
    vim \
    && rm -rf /var/lib/apt/lists/*
    

WORKDIR /opt

# /opt/minimap2-2.24_x64-linux
RUN curl -L https://github.com/lh3/minimap2/releases/download/v2.24/minimap2-2.24_x64-linux.tar.bz2 \
    | tar -jxvf -

# /opt/hifiasm-0.16.1
RUN curl -L https://github.com/chhylp123/hifiasm/archive/refs/tags/0.16.1.tar.gz \
    | tar -xzvf - \
    && cd hifiasm-0.16.1 \
    && make \
    && wget -P /usr/local/src https://bootstrap.pypa.io/pip/2.7/get-pip.py \
    && python2 /usr/local/src/get-pip.py \
    && python2 -m pip --no-cache-dir install biopython==1.70

# /opt/MitoFinder
RUN git clone https://github.com/RemiAllio/MitoFinder.git \
    && cd MitoFinder \
    && ./install.sh \
    && sed -i 's/\/usr\/bin\/python/\/usr\/bin\/env python/' mitofinder
RUN chmod -R 755 /opt/MitoFinder

RUN git clone https://github.com/weizhongli/cdhit.git && \
    cd cdhit && \
    make MAX_SEQ=10000000 

RUN mkdir -p /opt/wrappers

COPY mitos_wrapper.sh /opt/wrappers/runmitos.py
COPY mitofinder_wrapper.sh /opt/wrappers/mitofinder

RUN chmod -R 755 /opt/wrappers

ARG CONDA_DIR=/opt/conda

RUN wget -P /usr/local/src https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
    && bash /usr/local/src/Miniconda3-latest-Linux-x86_64.sh -b -p $CONDA_DIR \
    && $CONDA_DIR/bin/conda install -n base conda-libmamba-solver

RUN $CONDA_DIR/bin/conda create -n mitos_env -c bioconda -c conda-forge mitos=2.1.0 "r-base>4"
RUN $CONDA_DIR/bin/conda create -n mitofinder_env --experimental-solver=libmamba python=2.7

RUN $CONDA_DIR/bin/conda clean -a

RUN mkdir -p /opt/databases

WORKDIR /opt/databases

RUN curl -L https://zenodo.org/record/4284483/files/refseq89m.tar.bz2?download=1 | tar -jxvf - \
    && curl -L https://zenodo.org/record/4284483/files/refseq89f.tar.bz2?download=1 | tar -jxvf -

WORKDIR /opt

RUN pip3 --no-cache-dir install --upgrade pip \
    && pip3 --no-cache-dir install biopython \
    pandas \
    Pillow \
    matplotlib \
    entrezpy \
    dna_features_viewer \
    bcbio-gff
