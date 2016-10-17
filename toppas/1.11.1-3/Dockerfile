# Base Image
FROM biocontainers/biocontainers:latest

# Metadata
LABEL base.image="biocontainers:latest"
LABEL version="2"
LABEL software="TOPPAS"
LABEL software.version="2016012"
LABEL description="a graphical workflow editor for the analysis of high-throughput proteomics data"
LABEL website="http://open-ms.sourceforge.net/workflow-integration/toppasworkflows/"
LABEL documentation="http://open-ms.sourceforge.net/workflow-integration/toppasworkflows/"
LABEL license="http://open-ms.sourceforge.net/workflow-integration/toppasworkflows/"
LABEL tags="Proteomics"

# Maintainer
MAINTAINER Felipe da Veiga Leprevost <felipe@leprevost.com.br>

USER root

RUN apt-get update && \
  apt-get install -y \
  openms=1.11.1-3 \
  topp=1.11.1-3 && \
  apt-get clean && \
  apt-get purge && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

USER biodocker

# some QT-Apps/Gazebo don't not show controls without this
ENV QT_X11_NO_MITSHM 1

WORKDIR /data/
