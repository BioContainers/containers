################## BASE IMAGE ######################

FROM python:3.10.8

################## METADATA ######################

LABEL base_image="python:3.10.8"
LABEL version="1"
LABEL about.summary="Python library for plotting."
LABEL software="seaborn"
LABEL software.version="0.12.2"
LABEL about.tags="implemented-in::python"
LABEL about.home="https://seaborn.pydata.org"
LABEL about.software="https://seaborn.pydata.org"
LABEL about.documentation="https://seaborn.pydata.org"
LABEL about.license="BSD-3-Clause"
LABEL about.license_file="https://github.com/mwaskom/seaborn/LICENSE.md"

################## MAINTAINER ######################
MAINTAINER "Ferriol Calvet <ferriol.calvet@irbbarcelona.org>"

################## INSTALLATION ######################

RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y \
    build-essential \
    libhdf5-dev

RUN pip install --upgrade pip
RUN pip install seaborn==0.12.2