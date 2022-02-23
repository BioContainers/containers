FROM biocontainers/biocontainers:v1.2.0_cv1 

################## METADATA ######################

LABEL base_image="biocontainers:v1.2.0_cv1"
LABEL version="1"
LABEL software="phylotools"
LABEL software.version="0.2.4"
LABEL about.summary="Phylogenetic Tools for Eco-Phylogenetics"
LABEL about.home="https://github.com/helixcn/phylotools"
LABEL about.documentation="https://github.com/helixcn/phylotools"
LABEL about.license_file="https://spdx.org/licenses/GPL-2.0-only.html"
LABEL about.license="SPDX::GPL-2-only"
LABEL about.tags="phylogenetics"

USER root
RUN apt-get update && apt-get install -y r-base build-essential libcurl4-gnutls-dev libxml2-dev libssl-dev
COPY install.R /root/install.R
RUN Rscript /root/install.R
USER biodocker

