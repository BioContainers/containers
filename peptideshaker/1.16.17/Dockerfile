################## BASE IMAGE ######################
FROM biocontainers/biocontainers:latest

################## METADATA ######################
LABEL base.image="biocontainers:latest"
LABEL version="1"
LABEL software="PeptideShaker"
LABEL software.version="1.16.17"
LABEL about.summary="interpretation of proteomics identification results"
LABEL about.home="http://compomics.github.io/projects/peptide-shaker.html"
LABEL about.documentation="http://compomics.github.io/projects/peptide-shaker.html"
LABEL about.license_file="Apache-2.0"
LABEL license_file="https://spdx.org/licenses/Apache-2.0.html"
LABEL about.tags="Proteomics, biotools"

################## MAINTAINER ######################
MAINTAINER Felipe da Veiga Leprevost <felipe@leprevost.com.br>

RUN ZIP=PeptideShaker-1.16.17.zip && \
    wget http://genesis.ugent.be/maven2/eu/isas/peptideshaker/PeptideShaker/1.16.17/$ZIP -O /tmp/$ZIP && \
    unzip /tmp/$ZIP -d /home/biodocker/bin/ && \
    rm /tmp/$ZIP && \
    bash -c 'echo -e "#!/bin/bash\njava -jar /home/biodocker/bin/PeptideShaker-1.16.17/PeptideShaker-1.16.17.jar $@"' > /home/biodocker/bin/PeptideShaker && \
    chmod +x /home/biodocker/bin/PeptideShaker

ENV PATH /home/biodocker/bin/PeptideShaker:$PATH

WORKDIR /data/
