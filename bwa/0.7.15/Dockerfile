################## BASE IMAGE ######################
FROM biocontainers/biocontainers:v1.0.0_cv4

################## METADATA ######################
LABEL base_image="biocontainers:v1.0.0_cv4"
LABEL version="4"
LABEL software="bwa"
LABEL software.version="0.7.15"
LABEL about.summary="Burrow-Wheeler Aligner for pairwise alignment between DNA sequences"
LABEL about.home="http://bio-bwa.sourceforge.net/"
LABEL about.documentation="http://bio-bwa.sourceforge.net/"
LABEL about.license_file="http://bio-bwa.sourceforge.net/"
LABEL about.license="SPDX:GPL-3.0"
LABEL extra.identifiers.biotools="bwa"
LABEL about.tags="Genomics"
LABEL extra.binaries="bwa"

################## MAINTAINER ######################
MAINTAINER Saulo Alves Aflitos <sauloal@gmail.com>

################## INSTALLATION ######################

RUN conda install bwa=0.7.15

WORKDIR /data/

# CMD ["bwa"]
