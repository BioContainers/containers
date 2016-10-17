# Base Image
FROM biocontainers/biocontainers:latest

# Metadata
LABEL base.image="biocontainers:latest"
LABEL version="2"
LABEL software="bowtie"
LABEL software.version="1.1.2"
LABEL description="an ultrafast memory-efficient short read aligner"
LABEL website="http://bowtie-bio.sourceforge.net/index.shtml"
LABEL documentation="http://bowtie-bio.sourceforge.net/manual.shtml"
LABEL license="http://bowtie-bio.sourceforge.net/index.shtml"
LABEL tags="Genomics"

# Maintainer
MAINTAINER Saulo Alves Aflitos <sauloal@gmail.com>

RUN conda install bowtie=1.1.2

WORKDIR /data/

CMD ["bowtie"]
