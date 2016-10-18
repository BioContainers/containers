# Base Image
FROM biocontainers/biocontainers:latest

# Metadata
LABEL base.image="biocontainers:latest"
LABEL version="1"
LABEL software="SearchGUI"
LABEL software.version="2.8.6"
LABEL description="graphical user interface for proteomics identification search engines"
LABEL website="https://code.google.com/p/searchgui/"
LABEL documentation="https://code.google.com/p/searchgui/"
LABEL license="https://code.google.com/p/searchgui/"
LABEL tags="Proteomics"

# Maintainer
MAINTAINER Felipe da Veiga Leprevost <felipe@leprevost.com.br>

RUN ZIP=SearchGUI-2.8.6.zip && \
    wget https://github.com/BioDocker/software-archive/releases/download/SearchGUI/$ZIP -O /tmp/$ZIP && \
    unzip /tmp/$ZIP -d /home/biodocker/bin/ && \
    rm /tmp/$ZIP && \
    bash -c 'echo -e "#!/bin/bash\njava -jar /home/biodocker/bin/SearchGUI-2.8.6/SearchGUI-2.8.6.jar $@"' > /home/biodocker/bin/SearchGUI && \
    chmod +x /home/biodocker/bin/SearchGUI

ENV PATH /home/biodocker/bin/SearchGUI:$PATH

WORKDIR /data/
