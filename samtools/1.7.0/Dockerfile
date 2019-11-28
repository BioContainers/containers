################## BASE IMAGE ######################

FROM biocontainers/biocontainers:v1.0.0_cv4

################## METADATA ######################

ARG software_version=1.7.0
LABEL base_image="biocontainers:v1.0.0_cv4"
LABEL version="4"
LABEL software="samtools"
LABEL software.version="$software_version"
LABEL about.summary="Tools for manipulating next-generation sequencing data"
LABEL about.home="https://github.com/samtools/samtools"
LABEL about.documentation="https://github.com/samtools/samtools"
LABEL about.license_file="https://github.com/samtools/samtools"
LABEL about.license_file="https://github.com/samtools/samtools/blob/develop/LICENSE"
LABEL about.license="SPDX:MIT"
LABEL about.tags="Genomics"
LABEL extra.identifiers.biotools="SAM"
LABEL extra.binaries="samtools"

################## MAINTAINER ######################
MAINTAINER Saulo Alves Aflitos <sauloal@gmail.com>

RUN conda install ncurses samtools=$software_version

WORKDIR /data/

# CMD ["samtools"]
