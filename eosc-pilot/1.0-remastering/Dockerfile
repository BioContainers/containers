FROM continuumio/miniconda
MAINTAINER Paolo Di Tommaso <paolo.ditommaso@gmail.com>

LABEL version="1.0"
LABEL software.version="1.0-remastering"
LABEL software="eosc-pilot"
LABEL about.summary="Science Demonstrator project in the context of the EOSC initiative aimed to explore the feasibility of data reproducibility and data re-mastering in genomics"
LABEL about.home="https://github.com/CRG-CNAG/EOSC-Pilot"
LABEL about.license="SPDX:MPL-2.0"
LABEL base_image="continuumio/miniconda"

RUN conda install -y -c r r-base 
 
RUN apt-get update && apt-get -y install build-essential ttf-dejavu  

RUN conda config --add channels defaults \
 && conda config --add channels conda-forge \
 && conda config --add channels bioconda \
 && conda install -y picard=2.9 bwa=0.7.15 fastqc=0.11.5 sambamba=0.6.6 

RUN conda install -y tabix
