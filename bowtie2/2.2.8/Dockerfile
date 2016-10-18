# Base Image
FROM biocontainers/biocontainers:latest

# Metadata
LABEL base.image="biocontainers:latest"
LABEL version="1"
LABEL software="bowtie2"
LABEL software.version="2.2.8"
LABEL description="an ultrafast memory-efficient short read aligner"
LABEL website="http://bowtie-bio.sourceforge.net/bowtie2/index.shtml"
LABEL documentation="http://bowtie-bio.sourceforge.net/bowtie2/index.shtml"
LABEL license="http://bowtie-bio.sourceforge.net/bowtie2/index.shtml"
LABEL tags="Genomics"

# Maintainer
MAINTAINER Saulo Alves Aflitos <sauloal@gmail.com>

RUN conda install bowtie2=2.2.8

WORKDIR /data/

CMD ["bowtie2"]
