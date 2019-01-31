################## BASE IMAGE ######################
FROM biocontainers/biocontainers:v1.0.0_cv4

################## METADATA ######################
LABEL base_image="biocontainers:v1.0.0_cv4"
LABEL version="3"
LABEL software="Samtools"
LABEL software.version="1.2"
LABEL about.summary="Tools for manipulating next-generation sequencing data"
LABEL about.home="https://github.com/samtools/samtools"
LABEL about.documentation="https://github.com/samtools/samtools"
LABEL about.license_file="https://github.com/samtools/samtools/blob/develop/LICENSE"
LABEL about.license="SPDX:MIT"
LABEL about.tags="Genomics"
LABEL extra.identifiers.biotools="SAM"

################## MAINTAINER ######################
MAINTAINER Saulo Alves Aflitos <sauloal@gmail.com>

RUN conda install samtools=1.2

WORKDIR /data/

CMD ["samtools"]
