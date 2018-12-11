################## BASE IMAGE ######################

FROM biocontainers/biocontainers:v1.0.0_cv4

################## METADATA ######################

LABEL base_image="biocontainers:v1.0.0_cv4"
LABEL version="2"
LABEL software="SearchGUI"
LABEL software.version="2.8.6"
LABEL about.summary="graphical user interface for proteomics identification search engines"
LABEL about.home="https://github.com/compomics/searchgui/"
LABEL about.documentation="https://github.com/compomics/searchgui/"
LABEL about.license_file="https://github.com/compomics/searchgui/blob/master/README.txt"
LABEL about.license="SPDX:Apache-2.0"
LABEL about.tags="Proteomics"
LABEL extra.identifiers.biotools="searchgui"

################## MAINTAINER ######################

MAINTAINER Felipe da Veiga Leprevost <felipe@leprevost.com.br>

RUN ZIP=SearchGUI-2.8.6.zip && \
    wget https://github.com/BioDocker/software-archive/releases/download/SearchGUI/$ZIP -O /tmp/$ZIP && \
    unzip /tmp/$ZIP -d /home/biodocker/bin/ && \
    rm /tmp/$ZIP

RUN bash -c 'echo -e "#!/bin/bash\njava -jar /home/biodocker/bin/SearchGUI-2.8.6/SearchGUI-2.8.6.jar \$@"' > /home/biodocker/bin/SearchGUI && \
    chmod +x /home/biodocker/bin/SearchGUI

ENV PATH /home/biodocker/bin/SearchGUI:$PATH

WORKDIR /data/
