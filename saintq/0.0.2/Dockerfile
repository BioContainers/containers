################## BASE IMAGE ######################
FROM biocontainers/biocontainers:v1.0.0_cv4

################## METADATA ######################
LABEL base_image="biocontainers:v1.0.0_cv4"
LABEL version="3"
LABEL software="SAINTq"
LABEL software.version="0.0.2"
LABEL about.summary="assigning confidence scores to protein-protein interactions based on quantitative proteomics"
LABEL about.home="http://saint-apms.sourceforge.net/Main.html"
LABEL about.documentation="http://saint-apms.sourceforge.net/Main.html"
LABEL about.license_file="http://saint-apms.sourceforge.net/Main.html"
LABEL about.tags="Proteomics"
LABEL extra.identifiers.biotools="SAINT"

################## MAINTAINER ######################

MAINTAINER Felipe da Veiga Leprevost <felipe@leprevost.com.br>

USER biodocker

RUN ZIP=saintq.zip && \
  wget https://github.com/BioDocker/software-archive/releases/download/SAINTq/$ZIP -O /tmp/$ZIP && \
  unzip /tmp/$ZIP -d /home/biodocker/bin/SAINT/ && \
  chmod -R 755 /home/biodocker/bin/SAINT/* && \
  rm /tmp/$ZIP

ENV PATH /home/biodocker/bin/SAINT:$PATH

WORKDIR /data/
