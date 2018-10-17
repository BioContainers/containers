################# BASE IMAGE ######################
FROM biocontainers/biocontainers:latest

################## METADATA ######################
LABEL base_image="biocontainers:latest"
LABEL version="2"
LABEL software="testci"
LABEL software.version="0.0.1"
LABEL about.summary="A test container for internal testing"

LABEL about.home="http://193.62.52.74/jenkins/"
LABEL about.license_file="gpl3+"
LABEL about.tags="test"


################## MAINTAINER ######################
MAINTAINER Olivier Sallou <olivier.sallou@irisa.fr>

################## INSTALLATION ######################
USER root

RUN mkdir -p /mnt/biocontainers/test-ci
RUN echo "test ok" > /mnt/biocontainers/test-ci/test-ci.txt
RUN echo "test pull request"

USER biodocker


WORKDIR /data/
