################## BASE IMAGE ######################

FROM biocontainers/biocontainers:latest

################## METADATA ######################

LABEL base_image="biocontainers:latest"
LABEL version="1"
LABEL software="Control-FREEC"
LABEL software.version="11.5"
LABEL about.summary="Prediction of copy numbers and allelic content using deep-sequencing data"
LABEL about.home="http://boevalab.inf.ethz.ch/FREEC/index.html"
LABEL about.documentation="http://boevalab.inf.ethz.ch/FREEC/index.html"
LABEL extra.identifiers.biotools="freec"
LABEL about.license="GPL-2+"
LABEL about.tags="Genomics"
LABEL container="control-freec"

################## MAINTAINER ######################

MAINTAINER SASC <sasc@lumc.nl>

################## INSTALLATION ######################

RUN conda install control-freec=11.5

WORKDIR /data/
