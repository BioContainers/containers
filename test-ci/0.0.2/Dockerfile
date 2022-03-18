################# BASE IMAGE ######################
FROM debian:stable-slim

################## METADATA ######################
LABEL base_image="debian:stable-slim"
LABEL version="4"
LABEL software="testci"
LABEL software.version="0.0.2"
LABEL about.summary="A test container for internal testing"

LABEL about.home="https://biocontainers.pro/"
LABEL about.license_file="gpl3+"
LABEL about.license="spdx:GPL-3.0-or-later"
LABEL about.tags="test"


################## MAINTAINER ######################
MAINTAINER Olivier Sallou <olivier.sallou@irisa.fr>

################## INSTALLATION ######################
USER root

RUN mkdir -p /mnt/biocontainers/test-ci
RUN echo "test is working" > /mnt/biocontainers/test-ci/test-ci.txt

USER biodocker


WORKDIR /data/
