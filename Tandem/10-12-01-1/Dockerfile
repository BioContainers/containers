#################################################################
# Dockerfile
#
# Version:          1
# Software:         X!Tandem
# Software Version: 10-12-01-1
# Description:      software that can match tandem mass spectra with peptide sequences
# Website:          http://www.thegpm.org/tandem/
# Tags:             Proteomics
# Provides:         tandem 10-12-01-1
# Base Image:       biodckr/biodocker:latest
# Build Cmd:        docker build --rm -t biodckr/tandem 10-12-01-1/.
# Pull Cmd:         docker pull biodckr/tandem
# Run Cmd:          docker run --rm biodckr/tandem
#################################################################

# Set the base image
FROM biodckr/biodocker:latest

################## BEGIN INSTALLATION ###########################

RUN ZIP=tandem-linux-10-12-01-1.zip && \
    wget https://github.com/BioDocker/software-archive/releases/download/X!Tandem/$ZIP -O /tmp/$ZIP && \
    unzip /tmp/$ZIP -d /home/biodocker/bin/ && \
    rm /tmp/$ZIP && \
    bash -c 'echo -e "#!/bin/bash\n/home/biodocker/bin/tandem-linux-10-12-01-1/bin/tandem.exe $@"' > /home/biodocker/bin/tandem && \
    chmod 755 /home/biodocker/bin/tandem

ENV PATH /home/biodocker/bin:$PATH

USER biodocker

WORKDIR /data

CMD ["tandem"]

##################### INSTALLATION END ##########################

# File Author / Maintainer
MAINTAINER Felipe da Veiga Leprevost <felipe@leprevost.com.br>
# Modified by Felipe da Veiga Leprevost 08-27-2015
