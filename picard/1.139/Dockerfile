################## BASE IMAGE ######################
FROM biocontainers/biocontainers:v1.0.0_cv4

################## METADATA ######################
LABEL base_image="biocontainers:v1.0.0_cv4"
LABEL version="3"
LABEL software="Picard"
LABEL software.version="1.139"
LABEL about.summary="A set of Java command line tools for manipulating high-throughput sequencing (HTS) data and formats."
LABEL about.home="https://github.com/broadinstitute/picard"
LABEL about.documentation="https://github.com/broadinstitute/picard"
LABEL about.license_file="https://github.com/broadinstitute/picard/blob/master/LICENSE.txt"
LABEL about.license="SPDX:MIT"
LABEL extra.identifiers.biotools="picard_tools"
LABEL about.tags="Genomics"

################## MAINTAINER ######################
MAINTAINER Saulo Alves Aflitos <sauloal@gmail.com>

RUN conda install picard=1.139

WORKDIR /data/
