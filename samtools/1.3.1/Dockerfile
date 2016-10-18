# Base Image
FROM biocontainers/biocontainers:latest

# Metadata
LABEL base.image="biocontainers:latest"
LABEL version="2"
LABEL software="Samtools"
LABEL software.version="1.3.1"
LABEL description="Tools for manipulating next-generation sequencing data"
LABEL website="https://github.com/samtools/samtools"
LABEL documentation="https://github.com/samtools/samtools"
LABEL license="https://github.com/samtools/samtools"
LABEL tags="Genomics"

# Maintainer
MAINTAINER Saulo Alves Aflitos <sauloal@gmail.com>

RUN conda install samtools=1.3.1

WORKDIR /data/

CMD ["samtools"]
