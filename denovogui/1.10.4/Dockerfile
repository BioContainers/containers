################## BASE IMAGE ######################
FROM biocontainers/biocontainers:v1.0.0_cv4

################## METADATA ######################
LABEL base_image="biocontainers:v1.0.0_cv4"
LABEL version="4"
LABEL software="denovogui"
LABEL software.version="1.10.4"
LABEL about.summary="graphical user interface for de novo sequencing of tandem mass spectra"
LABEL about.home="https://github.com/compomics/denovogui"
LABEL about.documentation="https://github.com/compomics/denovogui"
LABEL about.license_file="https://github.com/compomics/denovogui"
LABEL about.license="SPDX:Apache-2.0"
LABEL extra.identifiers.biotools="denovogui"
LABEL about.tags="Proteomics"

################## MAINTAINER ######################
MAINTAINER Felipe da Veiga Leprevost <felipe@leprevost.com.br>

################## INSTALLATION ######################

USER biodocker

ENV DISPLAY :0

RUN ZIP=DeNovoGUI-1.10.4.zip && \
    wget https://github.com/BioDocker/software-archive/releases/download/deNovoGUI/$ZIP -O /tmp/$ZIP && \
    unzip /tmp/$ZIP -d /home/biodocker/bin/ && \
    rm /tmp/$ZIP && \
    bash -c 'echo -e "#!/bin/bash\njava -jar /home/biodocker/bin/DeNovoGUI-1.10.4/DeNovoGUI-1.10.4.jar \$@" > /home/biodocker/bin/denovogui' && \
    chmod +x /home/biodocker/bin/denovogui

ENV PATH /home/biodocker/bin/denovogui:$PATH

WORKDIR /data/
