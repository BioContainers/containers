################## BASE IMAGE ######################
FROM biocontainers/biocontainers:v1.0.0_cv4

################## METADATA ######################
LABEL base_image="biocontainers:v1.0.0_cv4"
LABEL version="5"
LABEL software="Comet"
LABEL software.version="2016011"
LABEL about.summary="an open source tandem mass spectrometry sequence database search tool"
LABEL about.home="http://comet-ms.sourceforge.net/"
LABEL about.documentation="http://comet-ms.sourceforge.net/parameters/parameters_2016010/"
LABEL about.license_file="http://comet-ms.sourceforge.net/"
LABEL about.license="SPDX:Apache-2.0"
LABEL extra.identifiers.biotools="comet"
LABEL about.tags="Proteomics"
LABEL extra.binaries="comet"

################## MAINTAINER ######################
MAINTAINER Felipe da Veiga Leprevost <felipe@leprevost.com.br>

################## INSTALLATION ######################

USER biodocker

RUN ZIP=comet_binaries_2016011.zip && \
  wget https://github.com/BioDocker/software-archive/releases/download/Comet/$ZIP -O /tmp/$ZIP && \
  unzip /tmp/$ZIP -d /home/biodocker/bin/Comet/ && \
  chmod -R 755 /home/biodocker/bin/Comet/* && \
  rm /tmp/$ZIP

RUN mv /home/biodocker/bin/Comet/comet_binaries_2016011/comet.2016011.linux.exe /home/biodocker/bin/Comet/comet

ENV PATH /home/biodocker/bin/Comet:$PATH

WORKDIR /data/

# CMD ["comet"]
