FROM biocontainers/biocontainers:v1.0.0_cv5

LABEL base_image="biocontainers:v1.0.0_cv5"
LABEL version="1"
LABEL software="phylonet"
LABEL software.version="3.8.4-fix"
LABEL about.summary="a tool designed mainly for analyzing, reconstructing, and evaluating phylogenetic networks"
LABEL about.home="https://github.com/NakhlehLab/PhyloNet"
LABEL about.documentation="https://phylogenomics.rice.edu/html/phylonet.html"
LABEL about.license_file="https://phylogenomics.rice.edu/html/phylonetOverview.html"
LABEL about.license="GNU General Public License"
LABEL extra.identifiers.biotools="phylonet"
LABEL about.tags="Phylogenetics"

MAINTAINER Alexander Ramos-Diaz <ra.ramos.diaz@gmail.com>

USER root

ENV PHYLONET_VERSION=3.8.4_fix \
    DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt install -y default-jdk && \
    wget https://github.com/NakhlehLab/PhyloNet/releases/download/$PHYLONET_VERSION/PhyloNet.jar && \
    apt-get clean && \
    apt-get purge && \
    rm -rf /var/lib/apt/lists/* /tmp/*

USER biodocker