# Base Image
FROM biocontainers/biocontainers:latest

# Metadata
LABEL base.image="biocontainers:latest"
LABEL version="1"
LABEL software="ProteoWizard"
LABEL software.version="3_0_9740"
LABEL description="tools and software libraries that facilitate proteomics data analysis"
LABEL website="http://proteowizard.sourceforge.net/"
LABEL documentation="http://proteowizard.sourceforge.net/"
LABEL license="http://proteowizard.sourceforge.net/"
LABEL tags="Proteomics"

# Maintainer
MAINTAINER Felipe da Veiga Leprevost <felipe@leprevost.com.br>

USER biodocker

RUN ZIP=pwiz-bin-linux-x86_64-gcc48-release-3_0_9740.zip && \
    wget https://github.com/BioDocker/software-archive/releases/download/proteowizard/$ZIP -O /tmp/$ZIP && \
    unzip /tmp/$ZIP -d /home/biodocker/bin/pwiz/ && \
    chmod -R 755 /home/biodocker/bin/pwiz/* && \
    rm /tmp/$ZIP

ENV PATH /home/biodocker/bin/pwiz/pwiz-bin-linux-x86_64-gcc48-release-3_0_9740:$PATH

WORKDIR /data/
