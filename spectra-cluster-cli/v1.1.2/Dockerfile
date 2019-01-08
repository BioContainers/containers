################## BASE IMAGE ######################
FROM biocontainers/biocontainers:v1.0.0_cv4

################## METADATA ######################
LABEL base_image="biocontainers:v1.0.0_cv4"
LABEL version="3"
LABEL software="spectra-cluster-cli"
LABEL software.version="v1.1.2"
LABEL about.summary="PRIDE Cluster algorithm to cluster heterogeneous mass spectra"
LABEL about.home="https://github.com/spectra-cluster/spectra-cluster-cli"
LABEL about.documentation="https://github.com/spectra-cluster/spectra-cluster-cli"
LABEL about.license_file="https://github.com/spectra-cluster/spectra-cluster-cli/LICENSE"
LABEL about.license="SPDX:Apache-2.0"
LABEL about.tags="Proteomics"

################## MAINTAINER ######################
MAINTAINER Johannes Griss <jgriss@ebi.ac.uk>

RUN VERSION=1.1.2 && \
    ZIP=spectra-cluster-cli-${VERSION}-bin.zip && \
    wget https://github.com/spectra-cluster/spectra-cluster-cli/releases/download/spectra-cluster-cli-${VERSION}/$ZIP -O /tmp/$ZIP && \
    unzip /tmp/$ZIP -d /home/biodocker/bin/ && \
    rm /tmp/$ZIP && \
    bash -c "echo -e '#!/bin/bash\njava -jar /home/biodocker/bin/spectra-cluster-cli-1.1.2.jar \$@'" > /home/biodocker/bin/spectra-cluster-cli && \
    chmod +x /home/biodocker/bin/spectra-cluster-cli

ENV PATH /home/biodocker/bin/spectra-cluster-cli:$PATH

WORKDIR /data/
