############################### Dockerfile ##################################

FROM biocontainers/biocontainers:latest

################################# METADATA ###################################

LABEL base_image="biocontainers:latest"
LABEL version="1"
LABEL software="htslib"
LABEL software.version="1.9"
LABEL about.summary="C library for high-throughput sequencing data formats"
LABEL about.home="https://github.com/samtools/htslib"
LABEL about.provides="htslib 1.9"
LABEL about.license_file="https://github.com/samtools/htslib/blob/develop/LICENSE"
LABEL about.license="SPDX:MIT"
LABEL about.tags="Genomics"
LABEL extra.identifiers.biotools="HTSlib"

################## MAINTAINER ######################

MAINTAINER John McGonigle <j.e.mcgonigle@gmail.com>

################## INSTALLATION ######################

RUN conda install htslib=1.9

WORKDIR /data/

CMD ["bcftools"]