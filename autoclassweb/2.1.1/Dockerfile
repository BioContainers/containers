################## BASE IMAGE ######################
FROM ubuntu:20.04

################### METADATA #######################
LABEL base_image="ubuntu:20.04"
LABEL version="1"
LABEL software="autoclassweb"
LABEL software.version="2.1.1"
LABEL about.summary="A web app to run AutoClass C Bayesian clustering"
LABEL about.home="https://github.com/pierrepo/autoclassweb"
LABEL about.documentation="https://github.com/pierrepo/autoclassweb"
LABEL about.license_file="https://github.com/pierrepo/autoclassweb/blob/master/LICENSE.txt"
LABEL about.license="SPDX:BSD-3-Clause"
LABEL extra.identifiers.biotools="autoclassweb"
LABEL about.tags="Genomics Proteomics Omics Clustering Classification"

################## MAINTAINER ######################
LABEL maintainer="Pierre Poulain <pierre.poulain@cupnet.net>"

# Change default shell
SHELL ["/bin/bash", "-c"]

ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8

RUN apt update && \
    apt -y upgrade && \
    apt install -y git && \
    apt install -y wget && \
    apt install -y libc6-i386 && \
    apt autoremove -y && \
    apt clean && \
    rm -rf /var/lib/apt/lists/* /var/log/dpkg.log

# Create app directory
WORKDIR /app

# Download source code
RUN git clone --depth 1 https://github.com/pierrepo/autoclassweb.git /app

# Install conda
# See https://hub.docker.com/r/conda/miniconda3/dockerfile
ENV PATH /opt/miniconda3/bin:$PATH
RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-py38_4.9.2-Linux-x86_64.sh -O /tmp/miniconda.sh && \
    /bin/bash /tmp/miniconda.sh -b -p /opt/miniconda3 && \
    rm -f /tmp/miniconda.sh && \
    conda update conda

# Install conda env
ARG conda_env=autoclassweb
RUN conda env create -f environment-lock.yml && \
    conda clean -afy
ENV PATH /opt/miniconda3/envs/${conda_env}/bin:$PATH

# Install autoclass-c binary
# https://ti.arc.nasa.gov/tech/rse/synthesis-projects-applications/autoclass/autoclass-c/
RUN wget --quiet https://ti.arc.nasa.gov/m/project/autoclass/autoclass-c-3-3-6.tar.gz && \
    tar zxvf autoclass-c-3-3-6.tar.gz && \
    rm -f autoclass-c-3-3-6.tar.gz
ENV PATH "/app/autoclass-c/:${PATH}"

# Create shared directories
RUN mkdir -p /app/{config,logs,results}

# Expose volume and port
VOLUME /app/config
VOLUME /app/logs
VOLUME /app/results
EXPOSE 5000

# Run the web app
#CMD ["gunicorn", "--config", "gunicorn.py", "flaskapp:app"]
