# syntax=docker/dockerfile:1
################## BASE IMAGE ######################
FROM r-base:4.3.0

################## METADATA ######################

LABEL base_image="biocontainers:latest"
LABEL version="1"
LABEL software="allcatchr"
LABEL software.version="1.0.0"
LABEL about.summary="Gene expression classifier to identify B-precursor ALL subtypes and underlying developmental trajectories"
LABEL about.home="https://github.com/ThomasBeder/ALLCatchR"
LABEL about.documentation="https://github.com/ThomasBeder/ALLCatchR"
LABEL about.license_file="https://github.com/ThomasBeder/ALLCatchR/blob/main/LICENSE.txt"
LABEL about.license="MIT"
LABEL about.tags="Transcriptomics"

################## MAINTAINER ######################

MAINTAINER Nadine Wolgast <NadineWolgast@gmx.de>

################## INSTALLATION ######################

USER root
ENV DEBIAN_FRONTEND=noninteractive
# Install system dependencies
RUN apt-get update && apt-get install -y libcurl4-openssl-dev libssl-dev libfontconfig1-dev \
    libxml2-dev libharfbuzz-dev libfribidi-dev libfreetype6-dev \
    libpng-dev libtiff5-dev libjpeg-dev build-essential
RUN R -e "install.packages(\"devtools\")" 
RUN R -e "library(devtools)"
RUN R -e "devtools::install_github(\"ThomasBeder/ALLCatchR\")"
RUN R -e "library(ALLCatchR)"

USER biodocker

