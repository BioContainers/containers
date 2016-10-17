# Base Image
FROM biocontainers/biocontainers:latest

# Metadata
LABEL base.image="biocontainers:latest"
LABEL version="2"
LABEL software="X!Tandem"
LABEL software.version="10-12-01-1"
LABEL description="software that can match tandem mass spectra with peptide sequences"
LABEL website="http://www.thegpm.org/tandem/"
LABEL documentation="http://www.thegpm.org/tandem/"
LABEL license="http://www.thegpm.org/tandem/"
LABEL tags="Proteomics"

# Maintainer
MAINTAINER Felipe da Veiga Leprevost <felipe@leprevost.com.br>

RUN ZIP=tandem-linux-10-12-01-1.zip && \
  wget https://github.com/BioDocker/software-archive/releases/download/X!Tandem/$ZIP -O /tmp/$ZIP && \
  unzip /tmp/$ZIP -d /home/biodocker/bin/ && \
  rm /tmp/$ZIP && \
  bash -c 'echo -e "#!/bin/bash\n/home/biodocker/bin/tandem-linux-10-12-01-1/bin/tandem.exe $@"' > /home/biodocker/bin/tandem && \
  chmod 755 /home/biodocker/bin/tandem

ENV PATH /home/biodocker/bin:$PATH

USER biodocker

WORKDIR /data/
