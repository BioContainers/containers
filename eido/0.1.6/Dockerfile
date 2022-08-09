# Base Image
FROM ubuntu:latest

# Metadata
LABEL base_image="biocontainers:latest"
LABEL version="1"
LABEL software="eido"
LABEL software.version="0.1.6"
LABEL about.summary="An open source tool used to validate and convert PEP format sample metadata against a schema."
LABEL about.home="http://eido.databio.org/en/latest/"
LABEL about.license="BSD-2-Clause"
LABEL about.tags="PEP, metadata, validation"
LABEL extra.identifiers.biotools=eido-python-package

# Maintainer
MAINTAINER Nathan Sheffield <nsheff@virginia.edu>

USER root

RUN apt-get update && \
    apt-get install -y python3 python3-pip && \
    pip3 install eido==0.1.6
