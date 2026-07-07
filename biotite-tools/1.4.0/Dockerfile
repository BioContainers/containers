################## BASE IMAGE ######################

FROM biocontainers/biocontainers:v1.0.0_cv4

################## METADATA ######################

LABEL base_image="biocontainers:v1.0.0_cv4"
LABEL version="1"
LABEL about.summary="Biotite and related structure analysis tools"
LABEL software="Biotite"
LABEL software.version="1.4.0"
LABEL about.tags="Structural biology"
LABEL about.home="https://www.biotite-python.org/"
LABEL about.software="https://github.com/biotite-dev/biotite/archive/refs/tags/v1.4.0.tar.gz"
LABEL about.documentation="https://www.biotite-python.org/"
LABEL about.license="BSD-3-Clause"

################## MAINTAINER ######################
MAINTAINER David Prihoda <david.prihoda@gmail.com>

RUN conda install -c conda-forge \
    "biotite==1.4.0" \
    "biopython>=1.85" \
    "biopandas>=0.5.1" \
    "scipy>=1.16.2" \
    "fastcluster>=1.3.0" \
    "einops>=0.8.1" \
    && conda clean -a -y
