################## BASE IMAGE ######################
FROM biocontainers/biocontainers:v1.0.0_cv4

################## METADATA ######################

LABEL base_image="biocontainers:v1.0.0_cv4"
LABEL version="3"
LABEL software="PeptideProphet"
LABEL software.version="201510131012"
LABEL about.summary="Peptide assignment statistics and validation"
LABEL about.home="http://peptideprophet.sourceforge.net/"
LABEL about.documentation="http://peptideprophet.sourceforge.net/"
LABEL about.license_file="http://peptideprophet.sourceforge.net/"
LABEL about.license="SPDX:GPL-2.0-only"
LABEL about.tags="Proteomics"
LABEL extra.identifiers.biotools="peptideprophet"
LABEL extra.binaries="PeptideProphet"

################## MAINTAINER ######################
MAINTAINER Felipe da Veiga Leprevost <felipe@leprevost.com.br>

USER biodocker

RUN ZIP=PeptideProphetParser.zip && \
  wget https://github.com/BioDocker/software-archive/releases/download/PeptideProphet/$ZIP -O /tmp/$ZIP && \
  unzip /tmp/$ZIP -d /home/biodocker/bin/ && \
  chmod -R 755 /home/biodocker/bin/* && \
  rm /tmp/$ZIP

RUN mv /home/biodocker/bin/PeptideProphetParser /home/biodocker/bin/PeptideProphet

ENV PATH /home/biodocker/bin:$PATH

WORKDIR /data/

# CMD ["PeptideProphet"]
