################## BASE IMAGE ######################
FROM biocontainers/biocontainers:latest

################## METADATA ######################
LABEL base.image="biocontainers:latest"
LABEL version="1"
LABEL software="bowtie2"
LABEL software.version="2.2.8"
LABEL about.summary="an ultrafast memory-efficient short read aligner"
LABEL about.home="http://bowtie-bio.sourceforge.net/bowtie2/index.shtml"
LABEL about.documentation="http://bowtie-bio.sourceforge.net/bowtie2/index.shtml"
LABEL license="http://bowtie-bio.sourceforge.net/bowtie2/index.shtml"
LABEL about.tags="Genomics"

################## MAINTAINER ######################
MAINTAINER Saulo Alves Aflitos <sauloal@gmail.com>

################## INSTALLATION ######################

RUN conda install bowtie2=2.2.8

WORKDIR /data/

CMD ["bowtie2"]
