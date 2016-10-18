# Base Image
FROM biocontainers/biocontainers:latest

# Metadata
LABEL base.image="biocontainers:latest"
LABEL version="1"
LABEL software="NCBI BLAST+"
LABEL software.version="2.2.31"
LABEL description="basic local alignment search tool"
LABEL website="http://blast.ncbi.nlm.nih.gov/Blast.cgi?CMD=Web&PAGE_TYPE=BlastHome"
LABEL documentation="http://blast.ncbi.nlm.nih.gov/Blast.cgi?CMD=Web&PAGE_TYPE=BlastHome"
LABEL license="http://blast.ncbi.nlm.nih.gov/Blast.cgi?CMD=Web&PAGE_TYPE=BlastHome"
LABEL tags="Genomics"

# Maintainer
MAINTAINER Saulo Alves Aflitos <sauloal@gmail.com>

RUN conda install blast=2.2.31

WORKDIR /data/
