################## BASE IMAGE ######################
FROM mambaorg/micromamba:1.5.3-jammy-cuda-11.8.0

################## METADATA ######################
LABEL base_image="mambaorg/micromamba:1.5.3-jammy-cuda-11.8.0"
LABEL version="1"
LABEL software="TCRdock"
LABEL software.version="1.0.0"
LABEL software.author="Philip Bradley <pbradley@fredhutch.org>"
LABEL about.summary="python tools for TCR:peptide-MHC modeling and analysis"
LABEL about.home="https://github.com/eliasball/TCRdock"
LABEL about.documentation="https://github.com/eliasball/TCRdock"
LABEL about.license_file="https://github.com/eliasball/TCRdock"
LABEL about.license="MIT (Apache-2.0 for original Alphafold)"
LABEL about.tags="Structure Prediction:Immunology"
LABEL maintainer="Elias Ball <contact.eliasball@gmail.com>"
MAINTAINER Elias Ball <contact.eliasball@gmail.com>

################## INSTALLATION ######################

USER root

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install git wget -y

USER mambauser

RUN cd /home/mambauser && \
    git clone https://github.com/eliasball/TCRdock.git --branch v1.0.0 && \
    cd TCRdock && \
    micromamba install --yes --name base --file env.yml && \
    micromamba clean --all --yes

ARG MAMBA_DOCKERFILE_ACTIVATE=1

WORKDIR /home/mambauser/TCRdock

RUN mkdir -p alphafold_params/params && \
    wget -O 'alphafold_params/params/params_model_2_ptm.npz' 'https://www.dropbox.com/s/e3uz9mwxkmmv35z/params_model_2_ptm.npz' && \
    wget -O 'alphafold_params/params/tcrpmhc_run4_af_mhc_params_891.pkl' 'https://www.dropbox.com/s/jph8v1mfni1q4y8/tcrpmhc_run4_af_mhc_params_891.pkl' && \
    python download_blast.py


WORKDIR /data/
