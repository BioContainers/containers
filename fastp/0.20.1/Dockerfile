################## BASE IMAGE ######################
FROM biocontainers/biocontainers:v1.1.0_cv2

################## METADATA ######################
LABEL base_image="biocontainers:v1.1.0_cv2"
LABEL version="1"
LABEL software="fastp"
LABEL software.version="0.20.1"
LABEL about.summary="A tool designed to provide fast all-in-one preprocessing for FastQ files"
LABEL about.home="https://github.com/OpenGene/fastp/"
LABEL about.documentation="https://github.com/OpenGene/fastp/"
LABEL about.license_file="https://github.com/OpenGene/fastp/"
LABEL about.license="SPDX:GPL-3.0"
LABEL extra.identifiers.biotools="fastp"
LABEL about.tags="Genomics"
LABEL extra.binaries="fastp"

################## MAINTAINER ######################
MAINTAINER Alvin Chen <ychen@aperiomics.com>

################## INSTALLATION ######################

RUN conda install fastp=0.20.1

WORKDIR /data/

# CMD ["fastp"]