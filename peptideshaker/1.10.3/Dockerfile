################## BASE IMAGE ######################
FROM biocontainers/biocontainers:v1.0.0_cv4

################## METADATA ######################
LABEL base_image="biocontainers:v1.0.0_cv4"
LABEL version="3"
LABEL software="PeptideShaker"
LABEL software.version="1.10.3"
LABEL about.summary="interpretation of proteomics identification results"
LABEL about.home="http://compomics.github.io/projects/peptide-shaker.html"
LABEL about.documentation="http://compomics.github.io/projects/peptide-shaker.html"
LABEL about.license_file="https://github.com/compomics/peptide-shaker/blob/master/README.txt"
LABEL about.license="SPDX:Apache-2.0"
LABEL about.tags="Proteomics"
LABEL extra.identifiers.biotools="peptideshaker"

################## MAINTAINER ######################
MAINTAINER Felipe da Veiga Leprevost <felipe@leprevost.com.br>

RUN ZIP=PeptideShaker-1.10.3.zip && \
    wget https://github.com/BioDocker/software-archive/releases/download/PeptideShaker/$ZIP -O /tmp/$ZIP && \
    unzip /tmp/$ZIP -d /home/biodocker/bin/ && \
    rm /tmp/$ZIP && \
    bash -c 'echo -e "#!/bin/bash\njava -jar /home/biodocker/bin/PeptideShaker-1.10.3/PeptideShaker-1.10.3.jar \$@"' > /home/biodocker/bin/PeptideShaker && \
    chmod +x /home/biodocker/bin/PeptideShaker

ENV PATH /home/biodocker/bin/PeptideShaker:$PATH

WORKDIR /data/
