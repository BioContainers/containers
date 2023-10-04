################## BASE IMAGE ######################

FROM python:3.10.8

################## METADATA ######################

LABEL base_image="python:3.10.8"
LABEL version="1"
LABEL about.summary="Python library for data manipulation and analysis."
LABEL software="pandas"
LABEL software.version="1.5.1"
LABEL about.tags="implemented-in::python"
LABEL about.home="https://pandas.pydata.org/"
LABEL about.software="https://pandas.pydata.org/about/index.html"
LABEL about.documentation="https://pandas.pydata.org/docs/"
LABEL about.license="BSD-3-Clause"
LABEL about.license_file="https://github.com/pandas-dev/pandas/blob/main/LICENSE"
LABEL about.author="https://github.com/pandas-dev/pandas/blob/main/AUTHORS.md"
LABEL extra.identifiers.biotools="pandas"

################## MAINTAINER ######################
MAINTAINER Lara Ianov lianov@uab.edu

################## INSTALLATION ######################

RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y \
    build-essential \
    libhdf5-dev

RUN pip install --upgrade pip
RUN pip install pandas==1.5.1
