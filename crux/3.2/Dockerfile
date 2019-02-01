################## BASE IMAGE ######################
FROM biocontainers/biocontainers:v1.0.0_cv4

################## METADATA ######################
LABEL base_image="biocontainers:v1.0.0_cv4"
LABEL version="3"
LABEL software="crux"
LABEL software.version="3.2"
LABEL about.summary="a software toolkit for tandem mass spectrometry analysis"
LABEL about.home="http://cruxtoolkit.sourceforge.net/"
LABEL about.documentation="http://cruxtoolkit.sourceforge.net/"
LABEL about.license_file="http://cruxtoolkit.sourceforge.net/"
LABEL about.license="SPDX:Apache-2.0"
LABEL extra.identifiers.biotools="crux"
LABEL about.tags="Proteomics"

################## MAINTAINER ######################
MAINTAINER Felipe da Veiga Leprevost <felipe@leprevost.com.br>

################## INSTALLATION ######################

USER biodocker

RUN ZIP=crux-3.2.Linux.x86_64.zip && \
  wget https://github.com/BioContainers/containers/releases/download/Crux/$ZIP -O /tmp/$ZIP && \
  unzip /tmp/$ZIP -d /home/biodocker/bin/ && \
  rm /tmp/$ZIP && \
  ln -sv /home/biodocker/bin/*/bin/* /home/biodocker/bin/

ENV PATH /home/biodocker/bin:$PATH

WORKDIR /data/
