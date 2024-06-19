################## BASE IMAGE ######################

FROM python:3.10.8

################## METADATA ######################

LABEL base_image="python:3.10.8"
LABEL version="1"
LABEL software="i2nca"
LABEL software.version="0.3.0"
LABEL about.summary="A mass spectrometry imaging tool bundle for preprocessing workflows"
LABEL about.home="https://github.com/cKNUSPeR/i2nca"
LABEL about.documentation="https://github.com/cKNUSPeR/i2nca"
LABEL about.license_file="https://github.com/cKNUSPeR/i2nca/blob/main/COPYING"
LABEL about.license="SPDX:GPL-3.0-only"
LABEL about.tags="Proteomics"

################## MAINTAINER ######################

MAINTAINER Jannik Witte <jw1217@gmx.de>

################## INSTALLATION ######################

WORKDIR /app

RUN apt-get update && apt-get install -y \
    libgl1 \
    git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
    
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir numpy==1.24 && \
    pip install --no-cache-dir pandas==2.1 && \
    pip install --no-cache-dir matplotlib==3.7 && \
    pip install --no-cache-dir scipy==1.12 && \
    pip install --no-cache-dir m2aia==0.5.1
    
RUN pip install git+https://github.com/cKNUSPeR/pyimzml.git#egg=pyimzml && \
    pip install git+https://github.com/cKNUSPeR/i2nca.git#egg=i2nca
    
RUN groupadd -g 1001 biodockergroup && \
    useradd -g biodockergroup -u 1001 biodocker
    
USER biodocker


