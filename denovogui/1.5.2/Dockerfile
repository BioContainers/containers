# Base Image
FROM biocontainers/biocontainers:latest

# Metadata
LABEL base.image="biocontainers:latest"
LABEL version="2"
LABEL software="denovogui"
LABEL software.version="1.5.2"
LABEL description="graphical user interface for de novo sequencing of tandem mass spectra"
LABEL website="https://github.com/compomics/denovogui"
LABEL documentation="https://github.com/compomics/denovogui"
LABEL license="https://github.com/compomics/denovogui"
LABEL tags="Proteomics"

# Maintainer
MAINTAINER Felipe da Veiga Leprevost <felipe@leprevost.com.br>

USER biodocker

ENV DISPLAY :0

RUN ZIP=DeNovoGUI-1.5.2.zip && \
    wget https://github.com/BioDocker/software-archive/releases/download/deNovoGUI/$ZIP -O /tmp/$ZIP && \
    unzip /tmp/$ZIP -d /home/biodocker/bin/ && \
    rm /tmp/$ZIP && \
    bash -c 'echo -e "#!/bin/bash\njava -jar /home/biodocker/bin/DeNovoGUI-1.5.2/DeNovoGUI-1.5.2.jar $@" > /home/biodocker/bin/denovogui' && \
    chmod +x /home/biodocker/bin/denovogui

ENV PATH /home/biodocker/bin/denovogui:$PATH

WORKDIR /data/
