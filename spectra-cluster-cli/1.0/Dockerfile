#################################################################
# Dockerfile
#
# Version:          1
# Software:         spectra-cluster-cli
# Software Version: v1.0-beta
# Description:      PRIDE Cluster algorithm to cluster heterogeneous mass spectra
# Website:          https://github.com/spectra-cluster/spectra-cluster-cli
# Tags:             Proteomics
# Provides:         spectra-cluster-cli 1.0
# Base Image:       biodckr/biodocker
# Build Cmd:        docker build --rm -t biodckr/spectra-cluster-cli 1.0/.
# Pull Cmd:         docker pull biodckr/spectra-cluster-cli
# Run Cmd:          docker run -ti biodckr/spectra-cluster-cli java -jar /home/biodocker/bin/spectra-cluster-cli-1.0-SNAPSHOT.jar <options> <files>
#################################################################

FROM biodckr/biodocker:latest

################## BEGIN INSTALLATION ###########################


RUN ZIP=spectra-cluster-cli-1.0-SNAPSHOT-bin.zip && \
    wget https://github.com/spectra-cluster/spectra-cluster-cli/releases/download/v1.0-beta/$ZIP -O /tmp/$ZIP && \
    unzip /tmp/$ZIP -d /home/biodocker/bin/ && \
    rm /tmp/$ZIP && \
    bash -c 'echo -e "#!/bin/bash\njava -jar /home/biodocker/bin/spectra-cluster-cli-1.0-SNAPSHOT-bin/spectra-cluster-cli-1.0-SNAPSHOT.jar $@" > /home/biodocker/bin/spectra-cluster-cli' && \
    chmod +x /home/biodocker/bin/spectra-cluster-cli

ENV PATH /home/biodocker/bin/spectra-cluster-cli:$PATH

WORKDIR /data/
##################### INSTALLATION END ##########################

# File Author / Maintainer
MAINTAINER Yasset Perez-Riverol <yperez@ebi.ac.uk>
