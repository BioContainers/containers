################# BASE IMAGE ######################
FROM biocontainers/biocontainers:latest

################## METADATA ######################
LABEL base_image="biocontainers:latest"
LABEL version="2"
LABEL software="testci"
LABEL software.version="0.0.2"
LABEL about.summary="A test container for internal testing"

LABEL about.home="https://biocontainers.pro/"
LABEL about.license_file="gpl3+"
LABEL about.tags="test"


################## MAINTAINER ######################
MAINTAINER Olivier Sallou <olivier.sallou@irisa.fr>

################## INSTALLATION ######################
USER root

RUN mkdir -p /mnt/biocontainers/test-ci
RUN echo "test is working" > /mnt/biocontainers/test-ci/test-ci.txt

USER biodocker


WORKDIR /data/
