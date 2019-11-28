################## BASE IMAGE ######################
FROM biocontainers/biocontainers:debian-stretch-backports

################## METADATA ######################
LABEL base_image="biocontainers:v1.0.0_cv4"
LABEL version="2.0.0"
LABEL software="Philosopher"
LABEL software.version="2.0.0"
LABEL about.summary="A complete toolkit for shotgun proteomics data analysis"
LABEL about.home="https://philosopher.nesvilab.org"
LABEL about.documentation="https://github.com/Nesvilab/philosopher/wiki"
LABEL about.license_file="https://github.com/Nesvilab/philosopher"
LABEL about.license="SPDX:GPL-3.0"
LABEL about.tags="Proteomics"

################## MAINTAINER ######################
MAINTAINER Felipe da Veiga Leprevost <felipe@leprevost.com.br>

USER root
RUN apt-get update && apt-get install -y wget
RUN ZIP=philosopher_linux_amd64.deb && \
  wget https://github.com/Nesvilab/philosopher/releases/download/v2.0.0/$ZIP -O /tmp/$ZIP && dpkg -i /tmp/$ZIP
RUN rm -rfv /tmp/$ZIP

USER biodocker

ENV PATH /home/biodocker/bin/:$PATH
WORKDIR /data/
