################## BASE IMAGE ######################

FROM condaforge/mambaforge:24.3.0-0

################## METADATA ######################

LABEL base_image="mambaforge:24.3.0-0"
LABEL version="1"
LABEL about.summary="NCBI Datasets is a new resource that lets you easily gather data from across NCBI databases."
LABEL software="ncbi-datasets-cli"
LABEL software.version="16.22.1"
LABEL about.tags="Genomics"
LABEL about.home="https://www.ncbi.nlm.nih.gov/datasets"
LABEL about.software="https://www.ncbi.nlm.nih.gov/datasets"
LABEL about.documentation="https://www.ncbi.nlm.nih.gov/datasets/docs/"
LABEL about.license="Custom License"
LABEL about.license_file="https://github.com/ncbi/datasets/blob/master/LICENSE.md"
LABEL about.author="NCBI"
LABEL extra.identifiers.biotools="ncbi_datasets"

################## MAINTAINER ######################
MAINTAINER Mateo Boudet <mateo.boudet@inrae.fr>

RUN apt update && \
    apt install -y zip && \
    apt autoremove -y && \
    apt clean && \
    rm -rf /var/lib/apt/lists/* /var/log/dpkg.log


RUN conda install -c conda-forge ncbi-datasets-cli=16.22.1
