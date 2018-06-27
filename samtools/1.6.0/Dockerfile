################## BASE IMAGE ######################

FROM biocontainers/biocontainers:latest

################## METADATA ######################

ARG software_version=1.6.0
LABEL base_image="biocontainers:latest"
LABEL version="2"
LABEL software="Samtools"
LABEL software.version="$software_version"
LABEL about.summary="Tools for manipulating next-generation sequencing data"
LABEL about.home="https://github.com/samtools/samtools"
LABEL about.documentation="https://github.com/samtools/samtools"
LABEL about.license_file="https://github.com/samtools/samtools"
LABEL about.license_file="https://github.com/samtools/samtools/blob/develop/LICENSE"
LABEL about.license="SPDX:MIT"
LABEL about.tags="Genomics"
LABEL extra.identifiers.biotools="SAM"

################## MAINTAINER ######################
MAINTAINER Saulo Alves Aflitos <sauloal@gmail.com>

RUN conda install samtools=$software_version

WORKDIR /data/

CMD ["samtools"]
