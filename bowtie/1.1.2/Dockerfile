################## BASE IMAGE ######################

FROM biocontainers/biocontainers:v1.0.0_cv4

################## METADATA ######################

LABEL base_image="biocontainers:v1.0.0_cv4"
LABEL version="4"
LABEL software="bowtie"
LABEL software.version="1.1.2"
LABEL about.summary="an ultrafast memory-efficient short read aligner"
LABEL about.home="http://bowtie-bio.sourceforge.net/index.shtml"
LABEL about.documentation="http://bowtie-bio.sourceforge.net/manual.shtml"
LABEL about.license_file="http://bowtie-bio.sourceforge.net/index.shtml"
LABEL about.license="SPDX:Artistic-2.0"
LABEL extra.identifiers.biotools="bowtie"
LABEL about.tags="Genomics"
LABEL extra.binaries="bowtie"

################## MAINTAINER ######################
MAINTAINER Saulo Alves Aflitos <sauloal@gmail.com>

################## INSTALLATION ######################

RUN conda install bowtie=1.1.2

WORKDIR /data/

# CMD ["bowtie"]
