# Base Image
FROM biocontainers/biocontainers:latest

# Metadata
LABEL base.image="biocontainers:latest"
LABEL version="2"
LABEL software="bamtools"
LABEL software.version="2.4.0"
LABEL description="C++ API & command-line toolkit for working with BAM data"
LABEL website="https://github.com/pezmaster31/bamtools"
LABEL documentation="https://github.com/pezmaster31/bamtools/wiki"
LABEL license="https://github.com/pezmaster31/bamtools/blob/master/LICENSE"
LABEL tags="Genomics"

# Maintainer
MAINTAINER Saulo Alves Aflitos <sauloal@gmail.com>

RUN conda install bamtools=2.4.0

WORKDIR /data/

CMD ["bamtools"]
