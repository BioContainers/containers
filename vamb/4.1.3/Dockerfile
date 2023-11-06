FROM --platform=linux/amd64 mambaorg/micromamba:1.5.1

MAINTAINER biocontainers <biodocker@gmail.com>

LABEL    software="vamb" \ 
    base_image=" mambaorg/micromamba:1.5.1" \ 
    container="vamb" \ 
    about.summary="VAMB: Variational autoencoders for metagenomic binning" \ 
    about.home="https://github.com/RasmussenLab/vamb" \ 
    software.version="4.1.3" \ 
    about.copyright="2017-2018, Ryan Wick" \ 
    about.license="MIT" \ 
    about.license_file="https://github.com/RasmussenLab/vamb/blob/master/LICENSE" \ 
    about.tags=""


ARG MAMBA_DOCKERFILE_ACTIVATE=1
ENV PATH=/opt/conda/bin:$PATH

COPY --chown=$MAMBA_USER:$MAMBA_USER env_vamp.yaml /tmp/env_vamp.yaml

RUN micromamba install -y -n base -f /tmp/env_vamp.yaml && \
    micromamba clean --all --yes

RUN pip install vamb==4.1.3
