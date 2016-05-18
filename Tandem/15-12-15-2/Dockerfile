#################################################################
# Dockerfile
#
# Version:          1
# Software:         X!Tandem
# Software Version: 15-12-15-2
# Description:      software that can match tandem mass spectra with peptide sequences
# Website:          http://www.thegpm.org/tandem/
# Tags:             Proteomics
# Provides:         tandem 15-12-15-2
# Base Image:       biodckr/biodocker:latest
# Build Cmd:        docker build --rm -t biodckr/tandem 15-12-15-2/.
# Pull Cmd:         docker pull biodckr/tandem
# Run Cmd:          docker run --rm biodckr/tandem tandem
#################################################################

# Set the base image
FROM biodckr/biodocker:latest

################## BEGIN INSTALLATION ###########################

RUN ZIP=tandem-linux-15-12-15-2.zip && \
  wget https://github.com/BioDocker/software-archive/releases/download/X!Tandem/$ZIP -O /tmp/$ZIP && \
  unzip /tmp/$ZIP -d /home/biodocker/bin/ && \
  rm /tmp/$ZIP && \
  bash -c 'echo -e "#!/bin/bash\n/home/biodocker/bin/tandem-linux-15-12-15-2/bin/tandem.exe $@"' > /home/biodocker/bin/tandem && \
  chmod 755 /home/biodocker/bin/tandem

ENV PATH /home/biodocker/bin:$PATH

USER biodocker

WORKDIR /data/

##################### INSTALLATION END ##########################

# File Author / Maintainer
MAINTAINER Felipe da Veiga Leprevost <felipe@leprevost.com.br>
