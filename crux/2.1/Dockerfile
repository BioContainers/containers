# Base Image
FROM biocontainers/biocontainers:latest

# Metadata
LABEL base.image="biocontainers:latest"
LABEL version="2"
LABEL software="crux"
LABEL software.version="2.1"
LABEL description="a software toolkit for tandem mass spectrometry analysis"
LABEL website="http://cruxtoolkit.sourceforge.net/"
LABEL documentation="http://cruxtoolkit.sourceforge.net/"
LABEL license="http://cruxtoolkit.sourceforge.net/"
LABEL tags="Proteomics"

# Maintainer
MAINTAINER Felipe da Veiga Leprevost <felipe@leprevost.com.br>

USER biodocker

RUN ZIP=crux-2.1.Linux.x86_64.zip && \
  wget https://github.com/BioDocker/software-archive/releases/download/Crux/$ZIP -O /tmp/$ZIP && \
  unzip /tmp/$ZIP -d /home/biodocker/bin/ && \
  rm /tmp/$ZIP && \
  ln -sv /home/biodocker/bin/*/bin/* /home/biodocker/bin/

ENV PATH /home/biodocker/bin:$PATH

WORKDIR /data/
