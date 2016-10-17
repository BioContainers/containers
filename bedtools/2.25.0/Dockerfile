# Base Image
FROM biocontainers/biocontainers:latest

# Metadata
LABEL base.image="biocontainers:latest"
LABEL version="2"
LABEL software="bedtools"
LABEL software.version="2.25.0"
LABEL description="a powerful toolset for genome arithmetic"
LABEL website="http://bedtools.readthedocs.io/en/latest/"
LABEL documentation="http://quinlanlab.org/tutorials/bedtools/bedtools.html"
LABEL license="https://github.com/arq5x/bedtools2/blob/master/LICENSE"
LABEL tags="Genomics"

# Maintainer
MAINTAINER Saulo Alves Aflitos <sauloal@gmail.com>

RUN conda install bedtools=2.25.0

WORKDIR /data/

CMD ["bedtools"]
