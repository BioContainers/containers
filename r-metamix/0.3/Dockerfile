################## BASE IMAGE ######################

FROM biocontainers/biocontainers:v1.2.0_cv2

################## METADATA ######################

LABEL base_image="biocontainers:v1.2.0_cv2"
LABEL version="1"
LABEL about.summary="R library for resolving complex metagenomic mixtures by analysing deep sequencing data, using a mixture model based approach."
LABEL software="r-metamix"
LABEL software.version="0.3"
LABEL about.tags="Metagenomics"
LABEL about.home="https://cran.r-project.org/src/contrib/Archive/metaMix/"
LABEL about.software="https://cran.r-project.org/src/contrib/Archive/metaMix/"
LABEL about.documentation="https://cran.r-project.org/src/contrib/Archive/metaMix/"
LABEL about.license="GPL-3.0-or-later"
LABEL about.licence_file="https://github.com/cran/metaMix/blob/master/DESCRIPTION"
LABEL about.author="Sofia Morfopoulou"
LABEL extra.identifiers.biotools="metaMix"

################## MAINTAINER ######################
MAINTAINER Sarah Buddle sarah.buddle.21@ucl.ac.uk

RUN conda update --all 
RUN conda config --append channels conda-forge
RUN conda install -c conda-forge r-metamix
