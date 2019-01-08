################## BASE IMAGE ######################
FROM biocontainers/biocontainers:v1.0.0_cv4

################## METADATA ######################
LABEL base_image="biocontainers:v1.0.0_cv4"
LABEL version="2"
LABEL software="ProteoWizard"
LABEL software.version="3_0_9740"
LABEL about.summary="tools and software libraries that facilitate proteomics data analysis"
LABEL about.home="http://proteowizard.sourceforge.net/"
LABEL about.documentation="http://proteowizard.sourceforge.net/"
LABEL about.license_file="http://proteowizard.sourceforge.net/"
LABEL about.license="SPDX:Apache-2.0"
LABEL extra.identifiers.biotools="proteowizard"
LABEL about.tags="Proteomics"

################## MAINTAINER ######################
MAINTAINER Felipe da Veiga Leprevost <felipe@leprevost.com.br>

USER biodocker

RUN ZIP=pwiz-bin-linux-x86_64-gcc48-release-3_0_9740.zip && \
    wget https://github.com/BioDocker/software-archive/releases/download/proteowizard/$ZIP -O /tmp/$ZIP && \
    unzip /tmp/$ZIP -d /home/biodocker/bin/pwiz/ && \
    chmod -R 755 /home/biodocker/bin/pwiz/* && \
    rm /tmp/$ZIP

ENV PATH /home/biodocker/bin/pwiz/pwiz-bin-linux-x86_64-gcc48-release-3_0_9740:$PATH

WORKDIR /data/
