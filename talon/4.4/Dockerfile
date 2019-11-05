################## BASE IMAGE ######################
FROM ubuntu:18.04

################## METADATA ######################
LABEL base_image="ubuntu:18.04"
LABEL version="1"
LABEL software="talon"
LABEL software.version="4.4"
LABEL about.summary="TALON is a Python program for identifying known and novel genes/isoforms in long read transcriptome data sets."
LABEL about.home="https://github.com/dewyman/TALON"
LABEL about.documentation="https://github.com/dewyman/TALON/blob/master/README.md"
LABEL about.license_file="https://github.com/dewyman/TALON/blob/master/LICENSE"
LABEL about.license="MIT"
LABEL about.tags="Transcriptomics"

################## MAINTAINER ######################
MAINTAINER SASC <sasc@lumc.nl>

################## INSTALLATION ######################
RUN apt-get clean all && \
    apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
        curl \
        grep \
        sed \
        dpkg \
        fuse \
        git \
        wget \
        zip \
        build-essential \
        pkg-config \
        bzip2 \
        ca-certificates && \
    apt-get clean && \
    apt-get purge && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh && \
    /bin/bash ~/miniconda.sh -b -p /opt/conda && \
    rm ~/miniconda.sh && chmod 777 -R /opt/conda/

RUN TINI_VERSION=`curl https://github.com/krallin/tini/releases/latest | grep -o "/v.*\"" | sed 's:^..\(.*\).$:\1:'` && \
    curl -L "https://github.com/krallin/tini/releases/download/v${TINI_VERSION}/tini_${TINI_VERSION}.deb" > tini.deb && \
    dpkg -i tini.deb && \
    rm tini.deb && \
    apt-get clean

RUN mkdir /data /config

RUN groupadd fuse && \
    useradd --create-home --shell /bin/bash --user-group --uid 1000 --groups sudo,fuse biodocker && \
    echo `echo "biodocker\nbiodocker\n" | passwd biodocker` && \
    chown biodocker:biodocker /data && \
    chown biodocker:biodocker /config

USER biodocker

ENV PATH=$PATH:/opt/conda/bin
ENV PATH=$PATH:/home/biodocker/bin
ENV HOME=/home/biodocker

RUN mkdir /home/biodocker/bin

RUN conda config --add channels bioconda && \
    conda upgrade conda

USER root

RUN conda install -y -c bioconda pybedtools && \
    ZIP=4.4 && \
    wget https://github.com/dewyman/TALON/archive/${ZIP}.zip -O /tmp/${ZIP}.zip && \
    unzip /tmp/${ZIP}.zip -d /home/biodocker/bin/ && \
    rm /tmp/${ZIP}.zip && \
    rm -rf /home/biodocker/bin/TALON-${ZIP}/testing_suite && \
    rm -rf /home/biodocker/bin/TALON-${ZIP}/archived && \
    rm -rf /home/biodocker/bin/TALON-${ZIP}/timing_tests && \
    rm -rf /home/biodocker/bin/TALON-${ZIP}/example && \
    rm /home/biodocker/bin/TALON-${ZIP}/diagram.png && \
    pip install /home/biodocker/bin/TALON-${ZIP} && \
    apt-get clean && \
    apt-get purge && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

USER biodocker

VOLUME ["/data", "/config"]

WORKDIR /data

################## TOOL INFO ##################
# talon_generate_report not working due to R dependencies.
