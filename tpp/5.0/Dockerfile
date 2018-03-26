################## BASE IMAGE ######################
FROM biocontainers/biocontainers:latest

################## METADATA ######################
LABEL base.image="biocontainers:latest"
LABEL version="3"
LABEL software="TPP"
LABEL software.version="5.0"
LABEL about.summary="a collection of integrated tools for MS/MS proteomics"
LABEL about.home="http://tools.proteomecenter.org/wiki/index.php?title=Software:TPP"
LABEL about.documentation="http://tools.proteomecenter.org/wiki/index.php?title=Software:TPP"
LABEL license="http://tools.proteomecenter.org/wiki/index.php?title=Software:TPP"
LABEL about.tags="Proteomics"

################## MAINTAINER ######################
MAINTAINER Felipe da Veiga Leprevost <felipe@leprevost.com.br>

USER root

WORKDIR /usr/local/

RUN apt-get update && apt-get install -y libfindbin-libs-perl && apt-get clean all
RUN apt-get update && apt-get install -y libxml-sax-expat-perl && apt-get clean all

RUN wget https://github.com/BioContainers/software-archive/releases/download/TPP/tpp-5.0.zip && \
  unzip tpp-5.0.zip
RUN chmod a+x /usr/local/tpp/bin/*

ENV PATH /usr/local/tpp/bin/:$PATH

USER biodocker

WORKDIR /data/
