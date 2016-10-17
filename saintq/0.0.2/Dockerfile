# Base Image
FROM biocontainers/biocontainers:latest

# Metadata
LABEL base.image="biocontainers:latest"
LABEL version="2"
LABEL software="SAINTq"
LABEL software.version="0.0.2"
LABEL description="assigning confidence scores to protein-protein interactions based on quantitative proteomics"
LABEL website="http://saint-apms.sourceforge.net/Main.html"
LABEL documentation="http://saint-apms.sourceforge.net/Main.html"
LABEL license="http://saint-apms.sourceforge.net/Main.html"
LABEL tags="Proteomics"

# Maintainer
MAINTAINER Felipe da Veiga Leprevost <felipe@leprevost.com.br>

USER biodocker

RUN ZIP=saintq.zip && \
  wget https://github.com/BioDocker/software-archive/releases/download/SAINTq/$ZIP -O /tmp/$ZIP && \
  unzip /tmp/$ZIP -d /home/biodocker/bin/SAINT/ && \
  chmod -R 755 /home/biodocker/bin/SAINT/* && \
  rm /tmp/$ZIP

ENV PATH /home/biodocker/bin/SAINT:$PATH

WORKDIR /data/
