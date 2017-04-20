# Base Image
FROM biocontainers/biocontainers:latest

# Metadata
LABEL base.image="biocontainers:latest"
LABEL version="2"
LABEL software="DIA-Umpire"
LABEL software.version="2.1.2"
LABEL description="computational analysis of data independent acquisition (DIA) mass spectrometry-based proteomics data"
LABEL website="http://diaumpire.sourceforge.net"
LABEL documentation="http://diaumpire.sourceforge.net"
LABEL license="http://diaumpire.sourceforge.net"
LABEL tags="Proteomics"

# Maintainer
MAINTAINER Felipe da Veiga Leprevost <felipe@leprevost.com.br>

USER root

RUN apt-get update && \
  apt-get install -y \
  gnuplot && \
  apt-get clean && \
  apt-get purge && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Installing TPP
RUN ZIP=tpp-5.0.zip && \
  mkdir -p /usr/local && \
  wget https://github.com/BioDocker/software-archive/releases/download/TPP/$ZIP -O /tmp/$ZIP && \
  unzip /tmp/$ZIP -d /usr/local && \
  rm /tmp/$ZIP

ENV PATH /usr/local/tpp/bin/:$PATH

# Installing DIA-Umpire
RUN ZIP=v2.1.2.zip && \
  wget https://github.com/BioDocker/software-archive/releases/download/DIA-Umpire/$ZIP -O /tmp/$ZIP && \
  unzip /tmp/$ZIP -d /home/biodocker/bin/DIA-Umpire/ && \
  chmod -R 755 /home/biodocker/bin/DIA-Umpire/ && \
  rm /tmp/$ZIP

ENV PATH /home/biodocker/bin/DIA-Umpire/:$PATH

# Installing Comet
RUN ZIP=comet_binaries_2016012.zip && \
  wget https://github.com/BioDocker/software-archive/releases/download/Comet/$ZIP -O /tmp/$ZIP && \
  unzip /tmp/$ZIP -d /home/biodocker/bin/comet/ && \
  rm /tmp/$ZIP && \
  chmod 755 /home/biodocker/bin/comet/comet_binaries_2016012/*.exe && \
  ln -sv /home/biodocker/bin/comet/*.exe /home/biodocker/bin/

ENV PATH /home/biodocker/bin/comet/:$PATH

# Installing MSGF+
RUN ZIP=MSGFPlus_9949.zip && \
  wget https://github.com/BioDocker/software-archive/releases/download/MSGFPlus/$ZIP -O /tmp/$ZIP && \
  unzip /tmp/$ZIP -d /home/biodocker/bin/MSGFPlus/ && \
  chmod -R 755 /home/biodocker/bin/MSGFPlus/* && \
  rm /tmp/$ZIP

ENV PATH /home/biodocker/bin/MSGFPlus/:$PATH

USER biodocker

WORKDIR /data/
