################## BASE IMAGE ######################

FROM biocontainers/biocontainers:v1.0.0_cv4

################## METADATA ######################

LABEL base_image="biocontainers:v1.0.0_cv4"
LABEL version="2"
LABEL software="strelka"
LABEL software.version="2.9.7"
LABEL about.summary="Strelka calls somatic and germline small variants from mapped sequencing reads"
LABEL about.home="https://github.com/Illumina/strelka"
LABEL about.documentation="https://github.com/Illumina/strelka/blob/master/docs/userGuide/README.md"
LABEL about.license_file="https://github.com/Illumina/strelka/blob/master/LICENSE.txt"
LABEL about.license="SPDX:GPL-3.0"
LABEL extra.identifiers.biotools="Strelka"
LABEL about.tags="Genomics"

################## MAINTAINER ######################

MAINTAINER Davy Cats <d.cats@lumc.nl>

################## INSTALLATION ######################

RUN conda install strelka=2.9.7
WORKDIR /data/
