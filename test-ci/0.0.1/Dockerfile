################# BASE IMAGE ######################
FROM biocontainers/biocontainers:latest

################## METADATA ######################
LABEL base.image="biocontainers:latest"
LABEL version="1"
LABEL software="testci"
LABEL software.version="0.0.1"
LABEL description="A test container for internal testing"

LABEL website="http://193.62.52.74/jenkins/"
LABEL license="gpl3+"
LABEL tags="test"


################## MAINTAINER ######################
MAINTAINER Olivier Sallou <olivier.sallou@irisa.fr>

################## INSTALLATION ######################
USER root

RUN mkdir -p /mnt/biocontainers/test-ci
RUN echo "test ok" > /mnt/biocontainers/test-ci/test-ci.txt

USER biodocker


WORKDIR /data/
