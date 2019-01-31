################## BASE IMAGE ######################

FROM biocontainers/biocontainers:v1.0.0_cv4

################## METADATA ######################
LABEL base_image="biocontainers:v1.0.0_cv4"
LABEL version="4"
LABEL software="abyss"
LABEL software.version="1.9.0"
LABEL about.summary="ABySS is a *de novo* sequence assembler"
LABEL about.home="http://www.bcgsc.ca/platform/bioinfo/software/abyss/releases/1.9.0"
LABEL about.documentation="https://github.com/bcgsc/abyss#abyss"
LABEL about.license_file="https://github.com/bcgsc/abyss/blob/master/LICENSE"
LABEL about.license="SPDX:GPL-3.0-only"
LABEL extra.identifiers.biotools="abyss"
LABEL about.tags="Genomics"

################## MAINTAINER ######################

MAINTAINER Saulo Alves Aflitos <sauloal@gmail.com>

################## INSTALLATION ######################

RUN conda install abyss=1.9.0

WORKDIR /data/
