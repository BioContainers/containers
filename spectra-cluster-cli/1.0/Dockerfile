################## BASE IMAGE ######################
FROM biocontainers/biocontainers:latest

################## METADATA ######################
LABEL base.image="biocontainers:latest"
LABEL version="1"
LABEL software="spectra-cluster-cli"
LABEL software.version="v1.0-beta"
LABEL about.summary="PRIDE Cluster algorithm to cluster heterogeneous mass spectra"
LABEL about.home="https://github.com/spectra-cluster/spectra-cluster-cli"
LABEL about.documentation="https://github.com/spectra-cluster/spectra-cluster-cli"
LABEL license="https://github.com/spectra-cluster/spectra-cluster-cli"
LABEL about.tags="Proteomics"

################## MAINTAINER ######################
MAINTAINER Yasset Perez-Riverol <yperez@ebi.ac.uk>

RUN ZIP=spectra-cluster-cli-1.0-SNAPSHOT-bin.zip && \
    wget https://github.com/spectra-cluster/spectra-cluster-cli/releases/download/v1.0-beta/$ZIP -O /tmp/$ZIP && \
    unzip /tmp/$ZIP -d /home/biodocker/bin/ && \
    rm /tmp/$ZIP && \
    bash -c 'echo -e "#!/bin/bash\njava -jar /home/biodocker/bin/spectra-cluster-cli-1.0-SNAPSHOT-bin/spectra-cluster-cli-1.0-SNAPSHOT.jar $@" > /home/biodocker/bin/spectra-cluster-cli' && \
    chmod +x /home/biodocker/bin/spectra-cluster-cli

ENV PATH /home/biodocker/bin/spectra-cluster-cli:$PATH

WORKDIR /data/
