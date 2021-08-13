# base image
FROM ubuntu:20.04

# metadata
LABEL base_image="ubuntu:20.04"
LABEL version="1"
LABEL software="conodictor"
LABEL software.version="2.3.1"
LABEL about.summary="Prediction of conopeptides superfamily from cone snail venom transcriptome."
LABEL about.home="https://github.com/koualab/conodictor"
LABEL about.license="MIT"
LABEL about.license_file="https://github.com/koualab/conodictor/blob/master/LICENSE"
LABEL maintainer="Anicet Ebou"
LABEL maintainer.email="anicet.ebou@gmail.com"

# install dependencies
RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get -y --no-install-recommends install \
    build-essential \
    libpcre++-dev \
    gfortran \
    ca-certificates \
    cmake \
    git \
    wget \
    python3 \
    python3-pip \
    zlib1g-dev \
    libpng-dev \
    libfile-slurp-perl && \
    apt-get autoclean && rm -rf /var/lib/apt/lists/*


# install hmmer
RUN wget http://eddylab.org/software/hmmer/hmmer.tar.gz && \
    tar -zxf hmmer.tar.gz && \
    rm hmmer.tar.gz && \
    cd hmmer-3.3.2 && \
    ./configure && \
    make && \
    make install && cd ..


# installer pftools3
RUN wget https://github.com/sib-swiss/pftools3/archive/refs/tags/v3.2.6.tar.gz -O pftools3.tar.gz && \
    tar -zxf pftools3.tar.gz && \
    rm pftools3.tar.gz && \
    mkdir pftools3-3.2.6/build &&\
    cd pftools3-3.2.6/build  &&\
    cmake .. -DCMAKE_INSTALL_PREFIX:PATH=/var/lib/pftools -DCMAKE_BUILD_TYPE=Release -DUSE_GRAPHICS=OFF -DUSE_PDF=ON && \
    make && \
    make install


# install conodictor
RUN git clone --depth=1 https://github.com/koualab/conodictor.git && \
    cd conodictor && \
    python3 -m pip install -r requirements.txt && \
    cd .. && mkdir /data && mkdir data/.config

# add pfscan to path
ENV PATH="$PATH:/var/lib/pftools/bin"

# set a writable directory for matplotlib
ENV MPLCONFIGDIR="/data/.config/matplotlib"

# add conodictor to path
ENV PATH="$PATH:/conodictor"

# add db path to env
ENV CONODB="/conodictor/db"

ENV LC_ALL=C

WORKDIR /data

