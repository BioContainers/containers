# Base Image
FROM biocontainers/biocontainers:latest

# Metadata
LABEL base_image="biocontainers:latest"
LABEL version="1"
LABEL software="eido"
LABEL software.version="0.1.6"
LABEL about.summary="An open source tool used to validate and convert PEP format sample metadata against a schema."
LABEL about.home="http://eido.databio.org/en/latest/"
LABEL about.license="bsd-2-clause"
LABEL about.tags="PEP, metadata, validation"
LABEL extra.identifiers.biotools=eido

# Maintainer
MAINTAINER Nathan Sheffield <nsheff@virginia.edu>

USER biodocker

RUN ZIP=v0.1.6.zip && \
    wget https://github.com/pepkit/eido/archive/refs/tags/$ZIP -O /tmp/$ZIP && \
    unzip /tmp/$ZIP -d /home/biodocker/bin/eido/ && \
    chmod -R 755 /home/biodocker/bin/eido/* && \
    rm /tmp/$ZIP

ENV PATH /home/biodocker/bin/eido:$PATH

WORKDIR /data/

