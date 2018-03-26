################## BASE IMAGE ######################

FROM biocontainers/biocontainers:latest

################## METADATA ######################
LABEL base.image="biocontainers:latest"
LABEL version="2"
LABEL software="bamtools"
LABEL software.version="2.4.0"
LABEL about.summary="C++ API & command-line toolkit for working with BAM data"
LABEL about.home="https://github.com/pezmaster31/bamtools"
LABEL about.documentation="https://github.com/pezmaster31/bamtools/wiki"
LABEL license="https://github.com/pezmaster31/bamtools/blob/master/LICENSE"
LABEL about.tags="Genomics"

################## MAINTAINER ######################

MAINTAINER Saulo Alves Aflitos <sauloal@gmail.com>

RUN conda install bamtools=2.4.0

WORKDIR /data/

CMD ["bamtools"]
