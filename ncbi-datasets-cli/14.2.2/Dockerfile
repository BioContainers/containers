################## BASE IMAGE ######################

FROM biocontainers/biocontainers:v1.2.0_cv2

################## METADATA ######################

LABEL base_image="biocontainers:v1.2.0_cv2"
LABEL version="2"
LABEL about.summary="NCBI Datasets is a new resource that lets you easily gather data from across NCBI databases."
LABEL software="ncbi-datasets-cli"
LABEL software.version="14.2.2"
LABEL about.tags="Genomics"
LABEL about.home="https://www.ncbi.nlm.nih.gov/datasets"
LABEL about.software="https://www.ncbi.nlm.nih.gov/datasets"
LABEL about.documentation="https://www.ncbi.nlm.nih.gov/datasets/docs/"
LABEL about.license="public_domain"
LABEL about.licence_file="https://github.com/ncbi/datasets/blob/master/LICENSE.md"
LABEL about.author="NCBI"
LABEL extra.identifiers.biotools="ncbi_datasets"

################## MAINTAINER ######################
MAINTAINER Priyanka Surana <ps22@sanger.ac.uk>

RUN conda install -c conda-forge ncbi-datasets-cli=14.2.2
