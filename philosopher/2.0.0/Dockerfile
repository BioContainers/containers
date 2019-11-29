################## BASE IMAGE ######################
FROM biocontainers/biocontainers:debian-stretch-backports

################## METADATA ######################
LABEL base_image="biocontainers/biocontainers:debian-stretch-backports"
LABEL version="2.0.0"
LABEL software="philosopher"
LABEL software.version="2.0.0"
LABEL about.summary="A complete toolkit for shotgun proteomics data analysis"
LABEL about.home="https://philosopher.nesvilab.org"
LABEL about.documentation="https://github.com/Nesvilab/philosopher/wiki"
LABEL about.license_file="https://github.com/Nesvilab/philosopher"
LABEL about.license="SPDX:GPL-3.0"
LABEL about.tags="Proteomics"

################## MAINTAINER ######################
MAINTAINER Yasset Perez-Riverol <yperez@ebi.ac.uk>

USER root
RUN apt-get update && apt-get install -y wget
RUN ZIP=philosopher_linux_amd64.deb && \
  wget https://github.com/Nesvilab/philosopher/releases/download/v2.0.0/$ZIP -O /tmp/$ZIP && dpkg -i /tmp/$ZIP && rm -rfv /tmp/$ZIP && \
  apt-get remove -y --purge wget && apt-get -y autoremove && apt-get clean && apt-get purge

USER biodocker

ENV PATH /home/biodocker/bin/:$PATH
WORKDIR /data/
