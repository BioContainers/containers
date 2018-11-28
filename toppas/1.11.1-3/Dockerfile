################## BASE IMAGE ######################
FROM ubuntu:trusty

################## METADATA ######################
LABEL base_image="ubuntu:trusty"
LABEL version="3"
LABEL software="TOPPAS"
LABEL software.version="1.11.1-3"
LABEL about.summary="a graphical workflow editor for the analysis of high-throughput proteomics data"
LABEL about.home="http://open-ms.sourceforge.net/workflow-integration/toppasworkflows/"
LABEL about.documentation="http://open-ms.sourceforge.net/workflow-integration/toppasworkflows/"
LABEL about.license_file="http://open-ms.sourceforge.net/workflow-integration/toppasworkflows/"
LABEL about.license="SPDX:BSD-2-Clause"
LABEL about.tags="Proteomics"
LABEL extra.identifiers.biotools="openms"

################## MAINTAINER ######################
MAINTAINER Felipe da Veiga Leprevost <felipe@leprevost.com.br>

USER root

RUN apt-get update && \
  apt-get install -y \
  openms=1.11.1-3 \
  topp=1.11.1-3 && \
  apt-get clean && \
  apt-get purge && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# some QT-Apps/Gazebo don't not show controls without this
ENV QT_X11_NO_MITSHM 1

WORKDIR /data/
