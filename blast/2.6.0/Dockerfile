################## BASE IMAGE ######################

FROM biocontainers/biocontainers:latest

################## METADATA ######################

LABEL base_image="biocontainers:latest"
LABEL version="1"
LABEL software="NCBI BLAST+"
LABEL software.version="2.6.0"
LABEL about.summary="basic local alignment search tool"
LABEL about.home="http://blast.ncbi.nlm.nih.gov/Blast.cgi?CMD=Web&PAGE_TYPE=BlastHome"
LABEL about.documentation="http://blast.ncbi.nlm.nih.gov/Blast.cgi?CMD=Web&PAGE_TYPE=BlastHome"
LABEL about.license_file="https://www.ncbi.nlm.nih.gov/IEB/ToolBox/CPP_DOC/lxr/source/scripts/projects/blast/LICENSE"
LABEL about.license="SPDX:MIT"
LABEL extra.identifiers.biotools="BLAST"
LABEL about.tags="Genomics"

################## MAINTAINER ######################

MAINTAINER Fábio Madeira <fabiomadeira@me.com>

################## INSTALLATION ######################

RUN conda install blast=2.6.0

WORKDIR /data/
