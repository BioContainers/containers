#################################################################
# Dockerfile
#
# Version:          1
# Software:         BioDocker base Image
# Software Version: 20150814
# Description:      Basic image for BioDocker
# Website:          http://biodocker.org/
# Tags:             Genomics|Proteomics|Transcriptomics|General|Metabolomics
# Provides:         autotools-dev|automake|cmake|curl|fuse|git|wget|zip|openjdk-7-jre|build-essential|pkg-config|python|python-dev|python-pip|zlib1g-dev
# Base Image:       ubuntu:14.04.3
# Build Cmd:        docker build --rm -t biodckr/biodocker .
# Pull Cmd:         docker pull biodckr/biodocker
# Run Cmd:          docker run --rm biodckr/biodocker bash
#################################################################
# Source Image
FROM ubuntu:14.04.3

# Set noninterative mode
ENV DEBIAN_FRONTEND noninteractive

################## BEGIN INSTALLATION ######################

# add apt mirror
RUN mv /etc/apt/sources.list /etc/apt/sources.list.bkp && \
    bash -c 'echo -e "deb mirror://mirrors.ubuntu.com/mirrors.txt precise main restricted universe multiverse\n\
deb mirror://mirrors.ubuntu.com/mirrors.txt precise-updates main restricted universe multiverse\n\
deb mirror://mirrors.ubuntu.com/mirrors.txt precise-backports main restricted universe multiverse\n\
deb mirror://mirrors.ubuntu.com/mirrors.txt precise-security main restricted universe multiverse\n\n" > /etc/apt/sources.list' && \
    cat /etc/apt/sources.list.bkp >> /etc/apt/sources.list && \
    cat /etc/apt/sources.list

# apt update and install global requirements
RUN apt-get clean all && \
    apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y  \
        autotools-dev   \
        automake        \
        cmake           \
        curl            \
        fuse            \
        git             \
        wget            \
        zip             \
        openjdk-7-jre   \
        build-essential \
        pkg-config      \
        python          \
	      python-dev      \
        python-pip      \
        bzip2           \
        ca-certificates \
        libglib2.0-0    \
        libxext6        \
        libsm6          \
        libxrender1     \
        git             \
        mercurial       \
        subversion      \
        zlib1g-dev &&   \
        apt-get clean && \
        apt-get purge && \
        rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh && \
    wget --quiet https://repo.continuum.io/miniconda/Miniconda2-4.0.5-Linux-x86_64.sh -O ~/miniconda.sh && \
    /bin/bash ~/miniconda.sh -b -p /opt/conda && \
    rm ~/miniconda.sh

RUN apt-get install -y curl grep sed dpkg && \
    TINI_VERSION=`curl https://github.com/krallin/tini/releases/latest | grep -o "/v.*\"" | sed 's:^..\(.*\).$:\1:'` && \
    curl -L "https://github.com/krallin/tini/releases/download/v${TINI_VERSION}/tini_${TINI_VERSION}.deb" > tini.deb && \
    dpkg -i tini.deb && \
    rm tini.deb && \
    apt-get clean

# create shared folders
RUN mkdir /data /config

# Add user biodocker with password biodocker
RUN useradd --create-home --shell /bin/bash --user-group --uid 1000 --groups sudo,fuse biodocker && \
    echo `echo "biodocker\nbiodocker\n" | passwd biodocker` && \
    chown biodocker:biodocker /data && \
    chown biodocker:biodocker /config

# Change user
USER biodocker

# Add $HOME/bin to path
ENV PATH=$PATH:/opt/conda/bin
ENV PATH=$PATH:/home/biodocker/bin
ENV HOME=/home/biodocker

# Create $HOME/bin folder
RUN mkdir /home/biodocker/bin

# Add R and bioconda channel
RUN conda config --add channels r
RUN conda config --add channels bioconda

# Share default volumes
VOLUME ["/data", "/config"]

# Overwrite this with 'CMD []' in a dependent Dockerfile
CMD ["/bin/bash"]

# change workdir
WORKDIR /data

##################### INSTALLATION END #####################

# File Author / Maintainer
MAINTAINER Felipe da Veiga Leprevost <felipe@leprevost.com.br>
