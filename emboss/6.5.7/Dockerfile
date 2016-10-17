# Base Image
FROM biocontainers/biocontainers:latest

# Metadata
LABEL base.image="biocontainers:latest"
LABEL version="1"
LABEL software="emboss"
LABEL software.version="6.5.7"
LABEL description="software analysis package"
LABEL website="http://emboss.sourceforge.net/what/"
LABEL documentation="http://emboss.sourceforge.net/docs/"
LABEL license="http://emboss.sourceforge.net/licence/"
LABEL tags="Proteomics"

# Maintainer
MAINTAINER Felipe da Veiga Leprevost <felipe@leprevost.com.br>

RUN conda install emboss=6.5.7

WORKDIR /data/
