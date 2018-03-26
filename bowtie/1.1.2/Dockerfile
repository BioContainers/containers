################## BASE IMAGE ######################

FROM biocontainers/biocontainers:latest

################## METADATA ######################
LABEL base.image="biocontainers:latest"
LABEL version="2"
LABEL software="bowtie"
LABEL software.version="1.1.2"
LABEL about.summary="an ultrafast memory-efficient short read aligner"
LABEL about.home="http://bowtie-bio.sourceforge.net/index.shtml"
LABEL about.documentation="http://bowtie-bio.sourceforge.net/manual.shtml"
LABEL license="http://bowtie-bio.sourceforge.net/index.shtml"
LABEL about.tags="Genomics"

################## MAINTAINER ######################
MAINTAINER Saulo Alves Aflitos <sauloal@gmail.com>

################## INSTALLATION ######################

RUN conda install bowtie=1.1.2

WORKDIR /data/

CMD ["bowtie"]
