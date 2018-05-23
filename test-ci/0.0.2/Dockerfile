################# BASE IMAGE ######################
FROM biocontainers/biocontainers:latest

################## METADATA ######################
LABEL base_image="biocontainers:latest"
LABEL version="1"
LABEL software="testci"
LABEL software.version="0.0.2"
LABEL about.summary="A test container for internal testing"

LABEL about.home="http://193.62.52.74/jenkins/"
LABEL about.license="SPDX:GPL-3.0+"
LABEL about.license_file="https://opensource.org/licenses/GPL-3.0"
LABEL about.tags="test"


################## MAINTAINER ######################
MAINTAINER Olivier Sallou <olivier.sallou@irisa.fr>

################## INSTALLATION ######################
USER root

RUN mkdir -p /mnt/biocontainers/test-ci
RUN echo "Test is working" > /mnt/biocontainers/test-ci/test-ci.txt

USER biodocker


WORKDIR /data/

###Fake pull request for testing purposes
