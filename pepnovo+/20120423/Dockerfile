# Base Image
FROM biocontainers/biocontainers:latest

# Metadata
LABEL base.image="biocontainers:latest"
LABEL version="2"
LABEL software="PepNovo+"
LABEL software.version="20120423"
LABEL description="de novo sequencing of low precision MS/MS data"
LABEL website="http://proteomics.ucsd.edu/Software/PepNovo/"
LABEL documentation="http://proteomics.ucsd.edu/Software/PepNovo/"
LABEL license="http://proteomics.ucsd.edu/Software/PepNovo/"
LABEL tags="Proteomics"

# Maintainer
MAINTAINER Felipe da Veiga Leprevost <felipe@leprevost.com.br>

USER root

RUN apt-get update && \
  apt-get install -y \
	dos2unix  && \
  apt-get clean && \
  apt-get purge && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

USER biodocker

RUN ZIP=PepNovo.20120423.zip && \
  wget https://github.com/BioDocker/software-archive/releases/download/PepNovo/$ZIP -O /tmp/$ZIP && \
  unzip /tmp/$ZIP -d /home/biodocker/bin/PepNovo/ && \
  rm /tmp/$ZIP && \
  cd /home/biodocker/bin/PepNovo/src && \
  make && \
  cp PepNovo_bin /home/biodocker/bin/ && \
  dos2unix /home/biodocker/bin/PepNovo/Models/*.* && \
  dos2unix /home/biodocker/bin/PepNovo/Models/*/*.*

ENV PATH /home/biodocker/bin:$PATH

USER biodocker

WORKDIR /data/
