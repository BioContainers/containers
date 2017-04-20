# Base Image
FROM biocontainers/biocontainers:latest

# Metadata
LABEL base.image="biocontainers:latest"
LABEL version="3"
LABEL software="TPP"
LABEL software.version="5.0"
LABEL description="a collection of integrated tools for MS/MS proteomics"
LABEL website="http://tools.proteomecenter.org/wiki/index.php?title=Software:TPP"
LABEL documentation="http://tools.proteomecenter.org/wiki/index.php?title=Software:TPP"
LABEL license="http://tools.proteomecenter.org/wiki/index.php?title=Software:TPP"
LABEL tags="Proteomics"

# Maintainer
MAINTAINER Felipe da Veiga Leprevost <felipe@leprevost.com.br>

USER root

WORKDIR /usr/local/

RUN apt-get update && apt-get install -y libfindbin-libs-perl && apt-get clean all

RUN wget https://github.com/BioContainers/software-archive/releases/download/TPP/tpp-5.0.zip && \
  unzip tpp-5.0.zip

ENV PATH /usr/local/tpp/bin/:$PATH

USER biodocker

WORKDIR /data/
