# Base Image
FROM biocontainers/biocontainers:latest

# Metadata
LABEL base.image="biocontainers:latest"
LABEL version="3"
LABEL software="abyss"
LABEL software.version="1.9.0"
LABEL description="ABySS is a *de novo* sequence assembler"
LABEL website="http://www.bcgsc.ca/platform/bioinfo/software/abyss/releases/1.9.0"
LABEL documentation="https://github.com/bcgsc/abyss#abyss"
LABEL license="https://github.com/bcgsc/abyss/blob/master/LICENSE"
LABEL tags="Genomics"

# File Author / Maintainer
MAINTAINER Saulo Alves Aflitos <sauloal@gmail.com>

RUN conda install abyss=1.9.0

WORKDIR /data/
