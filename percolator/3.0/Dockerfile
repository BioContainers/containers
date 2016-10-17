# Base Image
FROM biocontainers/biocontainers:latest

# Metadata
LABEL base.image="biocontainers:latest"
LABEL version="3"
LABEL software="Percolator"
LABEL software.version="3.0"
LABEL description="Semi-supervised learning for peptide identification from shotgun proteomics datasets"
LABEL website="http://percolator.ms/"
LABEL documentation="http://percolator.ms/"
LABEL license="http://percolator.ms/"
LABEL tags="Proteomics"

# Maintainer
MAINTAINER Felipe da Veiga Leprevost <felipe@leprevost.com.br>

USER root

RUN ZIP=ubuntu64_release.tar.gz && \
    wget https://github.com/percolator/percolator/releases/download/rel-3-00/$ZIP -O /tmp/$ZIP && \
    tar xvzf /tmp/$ZIP && \
    chmod -R 755 /tmp/* && \
    dpkg -i percolator-converters-v3-00-linux-amd64.deb && \
    dpkg -i percolator-v3-00-linux-amd64.deb && \
    dpkg -i elude-v3-00-linux-amd64.deb && \
    rm /tmp/$ZIP

USER biodocker

WORKDIR /data/
