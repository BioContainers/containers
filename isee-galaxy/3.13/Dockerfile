#################### Metadata ########################

# Base image
FROM iseedevelopers/isee:latest

# Metadata
LABEL base_image="iseedevelopers/isee:latest"
LABEL version="1.0.0"
LABEL software="isee"
LABEL software.version="3.13"
LABEL about.summary="a web dashboard for visualization of single cell transcriptome data"
LABEL about.home="https://github.com/iSEE/iSEE/"
LABEL about.documentation="https://isee.github.io/iSEE/"
LABEL about.license_file="https://isee.github.io/iSEE/LICENSE-text.html"
LABEL about.license="SPDX:MIT"
LABEL extra.identifiers.biotools="isee"
LABEL about.tags="Transcriptomics"

# Maintainer
MAINTAINER Cameron Hyde <c.hyde@qcif.edu.au>

################## Installation ######################

# Install packages
RUN apt-get update -qq                       && \
    apt-get upgrade -y                       && \
    apt-get install -y python3-pip net-tools && \
    pip3 install galaxy-ie-helpers           && \
    apt-get clean                            && \
    apt-get autoremove -y

# Get run scripts
COPY ./scripts/* /scripts/

# Set working directory and app port
WORKDIR /data
ARG PORT=8888
ENV PORT=$PORT
EXPOSE $PORT
