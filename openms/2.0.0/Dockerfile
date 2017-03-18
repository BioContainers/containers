# Base Image
FROM biocontainers/biocontainers:latest

# Metadata
LABEL base.image="biocontainers:latest"
LABEL version="2"
LABEL software="OpenMS"
LABEL software.version="2.0.0-4build2"
LABEL description="C++ libraries ans tools for MS/MS data analysis"
LABEL website="http://open-ms.sourceforge.net/"
LABEL documentation="http://open-ms.sourceforge.net/"
LABEL license="http://open-ms.sourceforge.net/"
LABEL tags="Proteomics"

# Maintainer
MAINTAINER Felipe da Veiga Leprevost <felipe@leprevost.com.br>

USER root

RUN apt-get update && apt-get install -y \
  openms=2.0.0-4build2 \
  topp=2.0.0-4build2 && \
  apt-get clean && \
  apt-get purge && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#RUN echo "biodocker ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/biodocker

USER biodocker

# some QT-Apps/Gazebo don't not show controls without this
ENV QT_X11_NO_MITSHM 1

WORKDIR /data/
