################## BASE IMAGE ######################
FROM biocontainers/biocontainers:v1.0.0_cv4

################## METADATA ######################
LABEL base_image="biocontainers:v1.0.0_cv4"
LABEL version="2"
LABEL software="bowtie2"
LABEL software.version="2.2.8"
LABEL about.summary="an ultrafast memory-efficient short read aligner"
LABEL about.home="http://bowtie-bio.sourceforge.net/bowtie2/index.shtml"
LABEL about.documentation="http://bowtie-bio.sourceforge.net/bowtie2/index.shtml"
LABEL about.license_file="http://bowtie-bio.sourceforge.net/bowtie2/index.shtml"
LABEL about.license="SPDX:Artistic-2.0"
LABEL extra.identifiers.biotools="bowtie2"
LABEL about.tags="Genomics"

################## MAINTAINER ######################
MAINTAINER Saulo Alves Aflitos <sauloal@gmail.com>

################## INSTALLATION ######################

RUN conda install bowtie2=2.2.8

WORKDIR /data/

CMD ["bowtie2"]
