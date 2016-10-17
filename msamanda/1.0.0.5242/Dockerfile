# Base Image
FROM biocontainers/biocontainers:latest

# Metadata
LABEL base.image="biocontainers:latest"
LABEL version="2"
LABEL software="MSAmanda"
LABEL software.version="1.0.0.5242"
LABEL description="scoring system to identify peptides out of tandem mass spectrometry"
LABEL website="http://ms.imp.ac.at/?goto=msamanda"
LABEL documentation="http://ms.imp.ac.at/?goto=msamanda"
LABEL license="http://ms.imp.ac.at/?goto=msamanda"
LABEL tags="Proteomics"

# Maintainer
MAINTAINER Felipe da Veiga Leprevost <felipe@leprevost.com.br>

USER root

RUN apt-get update && \
  apt-get install -y \
  mono-complete && \
  apt-get clean && \
  apt-get purge && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN ZIP=MSAmanda_Standalone_LinuxMac_1.0.0.5243.zip && \
  wget https://github.com/BioDocker/software-archive/releases/download/MSAmanda/$ZIP -O /tmp/$ZIP && \
  unzip /tmp/$ZIP -d /home/biodocker/bin && \
  rm /tmp/$ZIP && \
  chmod 755 /home/biodocker/bin/MSAmanda_Standalone_LinuxMac_1.0.0.5243/MSAmanda.exe && \
  bash -c 'echo -e "#!/bin/bash\nmono /home/biodocker/bin/MSAmanda_Standalone_LinuxMac_1.0.0.5243/MSAmanda.exe $@" > /home/biodocker/bin/MSAmanda' && \
  chmod +x /home/biodocker/bin/MSAmanda

ENV PATH /home/biodocker/bin/MSAmanda:$PATH

USER biodocker

WORKDIR /data/
