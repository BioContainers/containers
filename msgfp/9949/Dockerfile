################## BASE IMAGE ######################
FROM biocontainers/biocontainers:v1.0.0_cv4

################## METADATA ######################

LABEL base_image="biocontainers:v1.0.0_cv4"
LABEL version="4"
LABEL software="MSGF+"
LABEL software.version="9949"
LABEL about.summary="MS/MS database search tool"
LABEL about.home="http://proteomics.ucsd.edu/Software/MSGFPlus/"
LABEL about.documentation="http://proteomics.ucsd.edu/Software/MSGFPlus/"
LABEL about.license_file="https://github.com/MSGFPlus/msgfplus/blob/master/LICENSE.txt"
LABEL about.license="SPDX:CC-BY-NC-4.0"
LABEL about.tags="Proteomics"
LABEL extra.identifiers.biotools="msgfplus"

################## MAINTAINER ######################
MAINTAINER Felipe da Veiga Leprevost <felipe@leprevost.com.br>

RUN ZIP=MSGFPlus_9949.zip && \
  wget https://github.com/BioDocker/software-archive/releases/download/MSGFPlus/$ZIP -O /tmp/$ZIP && \
  unzip /tmp/$ZIP -d /home/biodocker/bin/MSGFPlus_9949/ && \
  rm /tmp/$ZIP && \
  bash -c "echo -e '#!/bin/bash\njava -jar /home/biodocker/bin/MSGFPlus_9949/MSGFPlus.jar \$@' > /home/biodocker/bin/MSGFPlus" && \
  chmod +x /home/biodocker/bin/MSGFPlus

ENV PATH /home/biodocker/bin/MSGFPlus:$PATH

USER biodocker

WORKDIR /data/
