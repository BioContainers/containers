# Base Image
FROM biocontainers/biocontainers:latest

# Metadata
LABEL base.image="biocontainers:latest"
LABEL version="1"
LABEL software="PeptideProphet"
LABEL software.version="201510131012"
LABEL description="Peptide assignment statistics and validation"
LABEL website="http://peptideprophet.sourceforge.net/"
LABEL documentation="http://peptideprophet.sourceforge.net/"
LABEL license="http://peptideprophet.sourceforge.net/"
LABEL tags="Proteomics"

# Maintainer
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

CMD ["PeptideProphet"]
