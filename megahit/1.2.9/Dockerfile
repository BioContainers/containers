FROM mambaorg/micromamba:0.25.1

################## METADATA ######################
LABEL base_image="mambaorg/micromamba:0.25.1"
LABEL version="1"
LABEL software="megahit"
LABEL software.version="1.2.9"
LABEL about.summary="Ultra-fast and memory-efficient NGS assembler"
LABEL about.home="https://github.com/voutcn/megahit"
LABEL about.documentation="https://github.com/voutcn/megahit/wiki"
LABEL about.license_file="https://github.com/voutcn/megahit/blob/master/LICENSE"
LABEL about.license="GNU General Public License v3.0"
LABEL about.tags="Genomics"
LABEL extra.identifiers.biotools="MEGAHIT"


# Activate conda env during docker build
ARG MAMBA_DOCKERFILE_ACTIVATE=1
# Set PATH manually, because nextflow doesn't activate base env by default.
ENV PATH=/opt/conda/bin:$PATH

# Copy conda env files
COPY env_megahit.yml /tmp

# Install packages
RUN micromamba install -n base -f /tmp/env_megahit.yml -y

# clean
RUN micromamba clean --all --yes

WORKDIR /data

# DEFINE DEFAULT COMMAND
# CMD ["megahit"]
##################### INSTALLATION END #####################

MAINTAINER Emilio Rios <emilio.rios@tum.de>
