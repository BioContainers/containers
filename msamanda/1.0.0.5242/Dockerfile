################## BASE IMAGE ######################

FROM biocontainers/biocontainers:v1.0.0_cv4

################## METADATA ######################

LABEL base_image="biocontainers:v1.0.0_cv4"
LABEL version="4"
LABEL software="MSAmanda"
LABEL software.version="1.0.0.5242"
LABEL about.summary="scoring system to identify peptides out of tandem mass spectrometry"
LABEL about.home="http://ms.imp.ac.at/?goto=msamanda"
LABEL about.documentation="http://ms.imp.ac.at/?goto=msamanda"
LABEL about.license_file="http://ms.imp.ac.at/?goto=msamanda"
LABEL about.license="SPDX:LGPL-3.0-only"
LABEL about.tags="Proteomics"

################## MAINTAINER ######################
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
  bash -c 'echo -e "#!/bin/bash\nmono /home/biodocker/bin/MSAmanda_Standalone_LinuxMac_1.0.0.5243/MSAmanda.exe \$@" > /home/biodocker/bin/MSAmanda' && \
  chmod +x /home/biodocker/bin/MSAmanda

ENV PATH /home/biodocker/bin/MSAmanda:$PATH

USER biodocker

WORKDIR /data/
